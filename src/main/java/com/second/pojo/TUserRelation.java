package com.second.pojo;


import java.io.Serializable;

public class TUserRelation implements Serializable {
    private Long users;

    private Long target;

    private Long status;

    private static final long serialVersionUID = 1L;

    public Long getUsers() {
        return users;
    }

    public void setUsers(Long users) {
        this.users = users;
    }

    public Long getTarget() {
        return target;
    }

    public void setTarget(Long target) {
        this.target = target;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", users=").append(users);
        sb.append(", target=").append(target);
        sb.append(", status=").append(status);
        sb.append("]");
        return sb.toString();
    }
}