package com.its.board.service;

import com.its.board.DTO.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public void save(BoardDTO boardDTO) {
        boardRepository.save(boardDTO);
    }


    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }


    public BoardDTO find(Long Id) {
        return boardRepository.find(Id);

    }

    public boolean up(BoardDTO boardDTO) {

        int result = boardRepository.up(boardDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }


    public void del(Long id) {
        boardRepository.del(id);
    }
}