package main

import (
	"github.com/gogf/gf/frame/g"
	_ "piankr/boot"
	_ "piankr/router"
)

func main() {
	g.Server().Run()
}
