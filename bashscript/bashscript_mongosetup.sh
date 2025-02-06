mongo_setup() {
    echo -e "\e[36m\n###### MongoDB Setup Başlatılıyor ######  \e[0m"

    mongosh <<EOF
    use blogDB
    db.getUsers()

    db.createUser({
      user: "blogAdmin",
      pwd: "BlogPass123",
      roles: [
        { role: "readWrite", db: "blogDB" }
      ]
    })

    db.posts.insertOne({
        header: "İlk Blog Yazım44",
        content: "Bu benim ilk blog yazımın içeriğidir.",
        author: "Hamit Mızrak.",
        tags: "java,jsp"
    })
EOF
    echo -e "\e[32mMongoDB işlemleri tamamlandı.\e[0m"
}

# Fonksiyonları Çağır
mongo_setup