User.delete_all
Library.delete_all
Book.delete_all

User.create(username: "Pan", email: "pan@gmail.com", password: "123456")
User.create(username: "Julia", email: "julia@gmail.com", password: "123456")

User.last.libraries.create(address: '48 Wall St')
Library.last.books.create(title: "Little life", author: 'Hanya Yanagihara')

Library.last.books.create(title: "American Gods", author: 'Neil Gaiman')

User.first.libraries.create(address: '438 Spring St')
