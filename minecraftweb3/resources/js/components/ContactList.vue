<template>
    <div class="contact-list" style="max-height: 800px;">
        <ul>
            <li v-for="(contact, index) in contacts" :key="contact.id" @click="selectContact(index, contact)" class="{'selected': index == selected}">
                <div class="avatar">
                    <img :src="contact.profile_image" :alt="contact.name">
                </div>
                <div class="contact">
                    <p class="name" style="font-weight: bold;">{{ contact.name }}</p>
                    <p class="email">{{ contact.email }}</p>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    props:{
        contacts:{
            type: Array,
            default: []
        }
    },
    data(){
        return{
            selected: 0
        };
    },
    methods:{
        selectContact(index, contact){
            this.selected = index;

            this.$emit('selected', contact);
        }
    }
}
</script>
<style lang="scss" scoped>
.contact-list {
    flex: 2;
    max-height: 800px;
    overflow: scroll;
    border-left: 1px solid black;
    ul{
        list-style-type: none;
        padding-left: 0;

        li {
        display: flex;
        padding: 2px;
        border-bottom: 1px solid black;
        position: relative;
        cursor: pointer;
        

        .selected{
            background: #dfdfdf;
        }
        .avatar {
        flex: 1;
        display: flex;
        align-items: center;
            img{
                width: 70px;
                border-radius: 50%;
                margin: 0 auto;
            }
        }
           .contact {
                flex: 3;
                font-size: 10px;
                overflow: hidden;
                flex-direction: column;
                justify-content: center;

                p{
                    margin: 0;
                    .name{
                        font-weight: bold;
                    }
                }
            }
        }
    }
}
</style>