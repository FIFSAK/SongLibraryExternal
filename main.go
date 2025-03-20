package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"log"
	"os"
	"time"
)

type GetSongInput struct {
	Group string `json:"group" binding:"required" example:"Muse"`
	Song  string `json:"song" binding:"required" example:"Supermassive Black Hole"`
}

type SongExternal struct {
	ID          uint      `gorm:"primaryKey"`
	GroupName   string    `gorm:"not null"`
	SongName    string    `gorm:"not null"`
	ReleaseDate time.Time `gorm:"not null"`
	Text        string    `gorm:"not null"`
	Link        string    `gorm:"not null"`
}

func main() {
	if err := godotenv.Load(); err != nil {
		log.Fatal("Error loading .env file")
	}

	dsn := os.Getenv("DATABASE_DSN")

	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("Failed to connect to database")
	}
	log.Println("Database connected")

	router := gin.New()

	router.GET("/info", GetSongHandler(db))

	port := os.Getenv("PORT")
	if port == "" {
		port = "8081"
	}
	log.Println("Server running on port %s", port)
	router.Run(":" + port)
}

func GetSongHandler(db *gorm.DB) gin.HandlerFunc {
	return func(c *gin.Context) {

		groupName := c.Query("group")
		songName := c.Query("song")

		song, err := GetSong(db, groupName, songName)
		fmt.Println(song)
		if err != nil {
			c.JSON(500, gin.H{"error": err.Error()})
			return
		}

		c.JSON(200, song)
	}
}

func GetSong(db *gorm.DB, groupName, songName string) (SongExternal, error) {
	var song SongExternal
	fmt.Println(groupName, songName)
	err := db.Where("group_name = ? AND song_name = ?", groupName, songName).First(&song).Error
	if err != nil {
		return SongExternal{}, err
	}
	return song, nil
}

func (SongExternal) TableName() string {
	return "songs_external"
}
