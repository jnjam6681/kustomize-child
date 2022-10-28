package main

import "github.com/gofiber/fiber/v2"

func main() {
	app := fiber.New()

	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!sssss")
	})

	app.Listen(":1323")
}

// package main

// import (
// 	"fmt"
// 	"time"
// )

// func main() {
// 	for {
// 		fmt.Println("Hello !fdrf")

// 		time.Sleep(time.Second * 1)
// 	}
// }
