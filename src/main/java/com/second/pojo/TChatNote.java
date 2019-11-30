package com.second.pojo;

import java.io.Serializable;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TChatNote implements Serializable {
    private Long id;

    private Long senderId;

    private Date craetAt;

    private String sendType;

    private Long targetId;

    private String content;

    private String targetName;

    public String getTargetName() {
        return targetName;
    }

    public void setTargetName(String targetName) {
        this.targetName = targetName;
    }

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSenderId() {
        return senderId;
    }

    public void setSenderId(Long senderId) {
        this.senderId = senderId;
    }

    public Date getCraetAt() {
        return craetAt;
    }

    public void setCraetAt(Date craetAt) {
        this.craetAt = craetAt;
    }

    public String getSendType() {
        return sendType;
    }

    public void setSendType(String sendType) {
        this.sendType = sendType == null ? null : sendType.trim();
    }

    public Long getTargetId() {
        return targetId;
    }

    public void setTargetId(Long targetId) {
        this.targetId = targetId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public String getTime(){
      return new SimpleDateFormat("MM/dd HH/mm").format(craetAt);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", senderId=").append(senderId);
        sb.append(", craetAt=").append(craetAt);
        sb.append(", sendType=").append(sendType);
        sb.append(", targetId=").append(targetId);
        sb.append(", content=").append(content);
        sb.append("]");
        return sb.toString();
    }
}