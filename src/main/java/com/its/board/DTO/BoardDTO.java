package com.its.board.DTO;
import lombok.*;
import java.time.LocalDateTime;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString

public class BoardDTO {

    private Long id;
    private String boardWriter;
    private String boardPass;
    private String boardTitle;
    private String boardContents;
    private int boardHits = 0;
    private Timestamp boardCreatedDate;

}
