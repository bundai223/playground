package main

import (
    "fmt"
)

type Person struct {
    FirstName string
    LastName  string
}

func (p *Person) Name() string {
    return p.FirstName + " " + p.LastName
}

type Named interface {
    Name() string
}

// パーさんは Name メソッドを持たない
type Persan struct {
    FirstName string
    LastName  string
}

func printName(named Named) {
    fmt.Println(named.Name())
}

func main() {
    person := &Person{"Tarou", "Yamada"}
    named, ok := interface{}(person).(Named)
    if ok {
        printName(named)
    } else {
        fmt.Println("Person is not Named intreface")
    }

    persan := &Persan{"Tarou", "Yamada"}
    named, ok = interface{}(persan).(Named)
    if ok {
        printName(named)
    } else {
        fmt.Println("Persan is not Named intreface")
    }
}
