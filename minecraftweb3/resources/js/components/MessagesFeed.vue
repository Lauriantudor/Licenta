<template>
    <div class="feed">
        <ul v-if="contact">
            <li v-for="message in messages" :key="message.id">
               <div v-if="message.to == contact.id" class="send">
                   <div class="text-send"> {{message.text}}</div>
               </div>  
               <div v-if="message.from == contact.id" class="receive">
                   <div class="text-receive"> {{message.text}}</div>
               </div>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    props:{
        contact:{
            type: Object
        },
        messages:{
            type: Array,
            required: true
        }
    }
}
</script>
<style lang="scss" scoped>
.feed{
    background: #f0f0f0;
    height: 100%;
    max-height: 570px;
    overflow: scroll;
    ul{
        list-style-type: none;
        padding: 5px;
        li{
            .message{
                margin: 10px 0;
                width: 100%;
                
                
               
            }
        }
    }
} 
.receive{
    text-align: right;
}
.text-receive{ max-width: 200px;
                    border-radius: 5px;
                    padding: 5px;
                    display: inline-block;
       background: red;
}     
.send{
    text-align: left;
}
.text-send{      max-width: 200px;
                    border-radius: 5px;
                    padding: 5px;
                    display: inline-block;
    background: green;
    }         
</style>