package main

import (
	"fmt"
	"net/http"
	"os"
	"time"

	"github.com/gin-gonic/gin"
)

var (
	ver                 = "v0.0.1"
	phase               = "local"
	hostname            = "local"
	pongMessageTemplate = "version %s pong, phase: %s, hostname: %s"
)

func main() {

	router := gin.Default()
	gin.SetMode("release")
	router.Group("v1")
	{
		router.GET("/ping", healthHandler)
	}

	s := &http.Server{
		Addr:         ":80",
		Handler:      router,
		ReadTimeout:  time.Duration(30) * time.Second,
		WriteTimeout: time.Duration(30) * time.Second,
	}
	fmt.Println("API listens on port 80")
	s.ListenAndServe()
}

func healthHandler(c *gin.Context) {

	if os.Getenv("VERSION") != "" {
		ver = os.Getenv("VERSION")
	}

	if os.Getenv("PHASE") != "" {
		phase = os.Getenv("PHASE")
	}

	if os.Getenv("HOSTNAME") != "" {
		hostname = os.Getenv("HOSTNAME")
	}

	pongMessage := fmt.Sprintf(pongMessageTemplate, ver, phase, hostname)

	c.JSON(200, gin.H{
		"message": pongMessage,
	})

}
