package pl.coderslab.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.entity.User;
import pl.coderslab.services.GameService;
import pl.coderslab.services.UserService;

import javax.servlet.http.HttpSession;
import java.util.regex.Pattern;

@Controller
public class UserController {

    @Autowired
    HttpSession session;
    @Autowired
    UserService userService;
    @Autowired
    GameService gameService;

    @PostMapping("/user")
    public String postUser(Model model,@RequestParam(required = false) String top10Level){
        if(session.getAttribute("user") == null){
            return "redirect:/main";
        }
        long userId = ((User)session.getAttribute("user")).getId();

        if(top10Level == null || top10Level.isEmpty()){
            return "redirect:/user";
        }
        if(!top10Level.matches("[1-3]")){
            return "redirect:/user";
        }


        model.addAttribute("top10Level", top10Level);
        return null;
    }

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

        model.addAttribute("top10", gameService.load10BestMovesByUserIdOnLevel(userId, 1));
        model.addAttribute("top10Level", 1);
        model.addAttribute("greenMoves", 1);

        return "user";
    }
}
