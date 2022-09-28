# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# CREATE USERS
first_user = User.create(name: 'Mauricio Cantillo', photo: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
  bio: "Hello, my name is Mauricio Cantillo and I'm 27 years old")
second_user = User.create(name: 'Andrew Cartman', photo: 'https://images.unsplash.com/photo-1493752603190-08d8b5d1781d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80',
  bio: "Hello, my name is Andrew Cartman and I'm 32 years old")
third_user = User.create(name: 'Jang Na-Young', photo: 'https://scontent.fctg3-1.fna.fbcdn.net/v/t1.6435-9/122679151_1805253612959390_2469251117814185709_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=7EyLbTJRYVcAX8na7nz&_nc_ht=scontent.fctg3-1.fna&oh=00_AT8mt1orrlGbfYUSfloX976le6NT5J-lB9ZsG_5xELQJ-g&oe=63527934',
  bio: "Hello, my name is Jang Na-Young and I'm 25 years old")
            
            
# CREATE POSTS
post = Post.create(author_id: first_user.id, author: first_user, title: "Why do I have to do this?", text: "Im really tired right now, but nobody cares so I have to keep going")
post2 = Post.create(author: first_user, title: "Have you ever thought you were great?", text: "You know, have you ever thought that? I was thinking maybe I am")
post3 = Post.create(author: first_user, title: "Too many meetings!!!", text: "Dude we're literally having 40 mandatory meetings a week, what the...?")
post4 = Post.create(author: first_user, title: "I think the new coworker needs more training", text: "Im not hating or anything, but I believe Na-Young could benefit from some training")
post5 = Post.create(author: first_user, title: "My boss is one of the best bosses I've ever had", text: "I almost love him lmfao")

# CREATE COMMENTS
comment = Comment.create(author: second_user, post: post, text:"Thats because you work here lmao, I literally pay you for that, you should sleep a little bit better though")
comment2 = Comment.create(author: second_user, post: post2, text:"It'd be better if you stopped daydraming and finished the project, its due tomorrow")
comment3 = Comment.create(author: first_user, post: post2, text:"I already finished thatm dont worry")
comment4 = Comment.create(author: second_user, post: post2, text:"Oh I see, come to the office after lunch lol, we have to discuss next week schedule")
comment5 = Comment.create(author: second_user, post: post3, text:"Only the necessary, please feel free to suggest changes if you dont agree with the schedule")
comment6 = Comment.create(author: first_user, post: post3, text:"I already submitted the changes I believe would benefit the company lol")
comment7 = Comment.create(author: third_user, post: post4, text:"Well I know I am not the best, but I AM doing my best")
comment8 = Comment.create(author: first_user, post: post4, text:"Im just teasing you because I know you love me lol")
comment9 = Comment.create(author: third_user, post: post4, text:"Lol dude you know the only thing I love is coffee")

#CREATE LIKES
like= Like.create(author: second_user, post: post)
like2= Like.create(author: third_user, post: post)
like3= Like.create(author: third_user, post: post2)
like4= Like.create(author: third_user, post: post3)
like5= Like.create(author: third_user, post: post4)
like6= Like.create(author: third_user, post: post5)
like7= Like.create(author: second_user, post: post2)
like8= Like.create(author: second_user, post: post3)
like9= Like.create(author: first_user, post: post5)
like10= Like.create(author: second_user, post: post5)