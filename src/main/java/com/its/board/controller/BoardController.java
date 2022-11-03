package com.its.board.controller;

import com.its.board.DTO.BoardDTO;
import com.its.board.DTO.PageDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
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
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
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
    public String board(@RequestParam("id")Long id , Model model , @RequestParam(value = "page",required = false,defaultValue = "1")int page ){
        BoardDTO findResult = boardService.find(id);
        model.addAttribute("board",findResult);
        model.addAttribute("page",page);
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

    //페이징목록
    @GetMapping("/board/paging")
    public String paging(Model model ,@RequestParam(value = "page",required = false,defaultValue = "1")int page){
        System.out.println("page = " + page);
        //해당 페이지에서 보여줄 글 목록
        List<BoardDTO>pagingList = boardService.pagingList(page);
        //하단 페이지 번호 표현을 위한 데이터
        PageDTO pageDTO = boardService.pagingParam(page);
       model.addAttribute("boardList",pagingList);
        model.addAttribute("paging",pageDTO);

        return "boardPages/boardPaging";
    }


    //검색처리
    @GetMapping("/search")
    public String search(@RequestParam("type")String type,@RequestParam("q")String q , Model model){
       List<BoardDTO>searchList = boardService.search(type,q);
       model.addAttribute("BoardList",searchList);
       return "boardPages/boardList";
    }











}
