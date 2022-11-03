package com.its.board.repository;

import com.its.board.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }
    public void saveFileName(BoardDTO boardDTO) {
        sql.insert("Board.saveFile",boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }


    public BoardDTO find(Long id) {
        sql.update("Board.up",id);
        BoardDTO result = sql.selectOne("Board.find",id);
        if(result.getFileAttached() == 1){
            return sql.selectOne("Board.findByIdFile",id);
        }else {
            return result;
        }

    }


    public int up(BoardDTO boardDTO)  {
        return sql.update("Board.update",boardDTO);
    }


    public void del(Long id) {
        sql.delete("Board.del",id);
    }


    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.pagingList",pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.boardCount");
    }

    public List<BoardDTO> search(Map<String, String> searchParams) {
        return sql.selectList("Board.search",searchParams);
    }
}
