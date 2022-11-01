package com.its.board.repository;

import com.its.board.DTO.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(BoardDTO boardDTO) {
        sql.insert("Board.save",boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }


    public BoardDTO find(Long Id) {
        sql.update("Board.up",Id);
        BoardDTO result = sql.selectOne("Board.find",Id);
        if(result!=null){
            return result;
        }else {
            return null;
        }

    }


    public int up(BoardDTO boardDTO)  {
        return sql.update("Board.update",boardDTO);
    }


    public void del(Long id) {
        sql.delete("Board.del",id);
    }





}
