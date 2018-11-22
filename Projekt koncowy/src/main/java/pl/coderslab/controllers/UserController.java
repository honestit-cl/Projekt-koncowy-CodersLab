package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.entity.User;
import pl.coderslab.services.GameService;
import pl.coderslab.services.UserService;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    HttpSession session;
    @Autowired
    UserService userService;
    @Autowired
    GameService gameService;

    @GetMapping("/user")
    public String getUser(Model model){
        if(session.getAttribute("user") == null){
            return "redirect:/main";
        }
        long userId = ((User)session.getAttribute("user")).getId();

        Integer winCount = gameService.countAllGamesByUserId(userId);
        Long movesCount = gameService.countAllMovesByUserId(userId);
        Long timeCount = gameService.countAllTimeByUserId(userId);

        movesCount = movesCount == null ? 0 : movesCount;
        timeCount = timeCount == null ? 0 : timeCount;

        model.addAttribute("winCount", winCount);
        model.addAttribute("movesCount", movesCount);
        model.addAttribute("timeCount", timeCount);

        model.addAttribute("gamesByMoves2", gameService.load10BestMovesByUserIdOnLevel(userId, 2));
        model.addAttribute("gamesByTime2", gameService.load10BestTimeByUserIdOnLevel(userId, 2));
        model.addAttribute("gamesByMoves3", gameService.load10BestMovesByUserIdOnLevel(userId, 3));
        model.addAttribute("gamesByTime3", gameService.load10BestTimeByUserIdOnLevel(userId, 3));
        model.addAttribute("gamesByMoves4", gameService.load10BestMovesByUserIdOnLevel(userId, 4));
        model.addAttribute("gamesByTime4", gameService.load10BestTimeByUserIdOnLevel(userId, 4));
        model.addAttribute("gamesByMoves5", gameService.load10BestMovesByUserIdOnLevel(userId, 5));
        model.addAttribute("gamesByTime5", gameService.load10BestTimeByUserIdOnLevel(userId, 5));
        return "user";
    }
}
