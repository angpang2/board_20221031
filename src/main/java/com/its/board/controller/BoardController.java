package com.its.board.controller;

import com.its.board.DTO.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
//@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @GetMapping("/board/save")
    public String savepage(){
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO){
        boardService.save(boardDTO);

        return "redirect:/board/";
    }

    @GetMapping("/board/")
    public String boardList(Model model){
        List<BoardDTO> result = boardService.boardList();
        model.addAttribute("BoardList",result);
        return "boardPages/boardList";
    }

    @GetMapping("/board")
    public String board(@RequestParam("id")Long Id , Model model ){
        BoardDTO findResult = boardService.find(Id);
        model.addAttribute("board",findResult);
        return "boardPages/boardDetail2";

    }


    @GetMapping("/update")
    public String update(@RequestParam("id")Long Id,Model model ){
       BoardDTO findResult =boardService.find(Id);
       model.addAttribute("board",findResult);
//       return "/boardUpdate";
       return "boardPages/boardpage";
    }

    @PostMapping("/update")
    public String up(@ModelAttribute BoardDTO boardDTO){
        boolean result = boardService.up(boardDTO);
        if(result){
            return "redirect:/board/?id="+boardDTO.getId();
        }else {
            return "index";
        }
    }

    @GetMapping("/del")
    public String del(@RequestParam("id")Long id){
        boardService.del(id);
        return "redirect:/board/";

    }

    @GetMapping("/boardpage")
    public String page(){
        return "boardPages/boardpage";
    }












}
