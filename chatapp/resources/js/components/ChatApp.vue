<template>
    <div class="container-chat clearfix">
   
        <div class="people-list" id="people-list">
      <div class="search">
        <input type="text" placeholder="search" />
        <i class="fa fa-search"></i>
      </div>
      <ul class="list">

        <li @click.prevent="selectUser(user.id)" class="clearfix" v-for="user in userList" :key="user.id" :class="{ 'selected': user ==selected}">
          
          <img :src="'image/'+user.avatar" alt="avatar" style="height: 35px; width: 35; border-radius: 50%;"/>
          
          <div class="about">
            
            <div class="name">{{user.name}}</div>
            <span class="unread" v-if="user.unread">{{user.unread}}</span>
            <div class="status" style="color:black">
              <div v-if="onlineUser(user.id) || online.id==user.id">
              <i  class="fa fa-circle online"></i> online
              </div>
              <div v-else>
                <i  class="fa fa-circle"></i> offline
              </div>
              
            </div>
            </div>
            
        </li>
      </ul>
    </div>
    
    <div class="chat">
      <div class="chat-header clearfix">
        <div class="chat-about">
          
          <div v-if="userMessage.user" class="chat-with">{{userMessage.user.name}}
            <ul class="nav nav-tabs">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">...</a>
                    <div class="dropdown-menu">
                      <a @click.prevent="deleteAllMessage(userMessage.user.id)" class="dropdown-item" href="#">Delete All Message</a>
                    </div>
                </li>
              </ul>
          </div>
          
          <div class="chat-num-messages">already 1 902 messages</div>
        </div>
        <i class="fa fa-star"></i>
      </div> <!-- end chat-header -->
      
      <div class="chat-history" v-chat-scroll>
        <ul>
          <li class="clearfix" v-for="message in userMessage.messages" :key="message.id">
            <div class="message-data align-right">
              <span class="message-data-time" >{{message.created_at | moment}}</span> &nbsp; &nbsp;
             
              <ul class="nav nav-tabs">
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">...</a>
                    <div class="dropdown-menu">
                      <a @click.prevent="deleteSingleMessage(message.id)" class="dropdown-item" href="#">Delete Message</a>
                    </div>
                </li>
              </ul>
              
            </div >
            <div v-if="message.message">
            <div :class="`message float-right ${message.to==userMessage.user.id ? 'other-message':'my-message'}`">
              {{message.message}}
            </div>
            </div>
            <div v-if="message.image">
            <div :class="`message float-right ${message.to==userMessage.user.id ? 'other-message':'my-message'}`">
              <img :src="'uploads'+ message.image">
            </div>
            </div>

          </li>
          
                 
          
        </ul>
        
      </div> <!-- end chat-history -->
      
      <div class="chat-message clearfix">
        <p v-if="typing">{{typing}} typing.....</p>
        <textarea v-if="userMessage.user" @keydown="typingEvent(userMessage.id)" @keydown.enter="sendMessage" v-model="message" name="message-to-send" id="message-to-send" placeholder ="Type your message" rows="3"></textarea>
        <textarea v-else disabled name="message-to-send" id="message-to-send" placeholder ="Type your message" rows="3"></textarea>
                
        <i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp;
        <div>
        <file-upload post-action="/sendmessage" ref="upload" @input-file="$refs.upload.action=true">
        <i class="fa fa-file-image-o"></i>
        </file-upload>
      </div>
        <button>Send</button>

      </div> <!-- end chat-message -->
      
    </div> <!-- end chat -->
    
    
  </div> <!-- end container -->
</template>
<script>
import  moment from 'moment'
import _ from 'lodash'

export default {
  mounted(){
    Echo.private(`chat.${authuser.id}`)
    .listen('MessageSend', (e) => {
     
      this.handleIncome(e.message);
       console.log(e.message);
    });
    this.$store.dispatch('userList');
    Echo.private('newmessage')
      .listen('MessageSend', (e) => {
        this.updateUnreadCount(e.user.id, true);
        console.log(e)
      });
    Echo.private(`typingevent`)
    .listenForWhisper('typing', (e) => {
      

      if(e.user.id == this.userMessage.user.id && authuser.id){
        this.typing= e.user.name;
       }
       setTimeout(() => {
         this.typing=''
       },1000)
    });
   Echo.join(`liveuser`)
    .here((users) => {
        this.users = users;
    })
    .joining((user) => {
        this.online = user;
    })
    .leaving((user) => {
        console.log(user.name);
    });
  },
 
  data(){
    return{
      avatar:null,
      userId:[],
      users:[],
      message:'',
      reset:false,
      typing:'',
      authuser:'',
      online:'',
      single:'',
      selected:null
    }
  },
  filters: {
  moment: function (date) {
    return moment(date).format('MMMM Do YYYY, h:mm:ss a');
  }
},
  computed:{
    userList(){
      return _.sortBy(this.$store.getters.userList,[(user)=>{
        if(user.id == this.selected){
          return Infinity;
        }
        return user.unread
      }]).reverse();
    },
    userMessage(){
      return this.$store.getters.userMessage
    },
    
  },
  created(){
    
  },
  methods:{
    selectUser(userId){
      
      this.$store.dispatch('userMessage', userId);
      this.selected = userId;
      this.updateUnreadCount(this.selected, true);
    },
    sendMessage(e){
      e.preventDefault();
      if(this.message!=''){
        axios.post('/sendmessage',{message:this.message,user_id:this.userMessage.user.id})
          .then(response=>{
            
            this.selectUser(this.userMessage.user.id);
          })
          this.message='';

      }
    },
    handleIncome(e){
      if(this.selectUser(this.userMessage.user.id) ){
        this.selectUser(e);
      };
      this.updateUnreadCount(e.from_user, false);
    },
    deleteSingleMessage(messageId){
      axios.get(`/deletesinglemessage/${messageId}`)
        .then(response=>{ 
          this.selectUser(this.userMessage.user.id)
        })
    },
    deleteAllMessage(userId){
       axios.get(`/deleteallmessage/${userId}`)
        .then(response=>{
          this.selectUser(userId)
          
        })
    },
    typingEvent(userId){
      Echo.private(`typingevent`)
    .whisper('typing', {
        'user': authuser,
        'typing': this.message,
        'userId': userId,
    });
    },
    onlineUser(userId){
      return _.find(this.users,{'id':userId});
    },
    updateUnreadCount(userId, reset){
      this.users = this.users.map((single)=>{
        if(single.id != userId){
          return single;
        }
        if(reset)
        single.unread =0;
        
        else
        single.unread +=1;
        return single;
        
      });
     
      
    }
  }
}
</script>
<style>
.people-list ul{
  overflow-y: scroll!important;
}
</style>