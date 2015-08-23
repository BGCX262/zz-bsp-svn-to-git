package com.youthor.bsp.core.abdf.model.wrapper;

import java.io.Serializable;

import com.youthor.bsp.core.abdf.model.MessageAccept;
import com.youthor.bsp.core.abdf.model.MessageSend;

public class MessageSendAndAccept implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private MessageSend messageSend;
    private MessageAccept messageAccept;
    
    public MessageSendAndAccept(){
        
    }
    
    public MessageSendAndAccept(MessageSend messageSend,MessageAccept messageAccept){
        this.messageAccept = messageAccept;
        this.messageSend = messageSend;
    }

    public MessageSend getMessageSend() {
        return messageSend;
    }

    public void setMessageSend(MessageSend messageSend) {
        this.messageSend = messageSend;
    }

    public MessageAccept getMessageAccept() {
        return messageAccept;
    }

    public void setMessageAccept(MessageAccept messageAccept) {
        this.messageAccept = messageAccept;
    }
}
