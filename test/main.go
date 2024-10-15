package main

import (
	"context"
	"fmt"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"log"
)

func main() {
	clientOptions := options.Client().ApplyURI("mongodb://127.0.0.1:27017/")
	client, err := mongo.Connect(context.TODO(), clientOptions)
	if err != nil {
		log.Fatal(err)
	}

	db := client.Database("myDatabase1")
	collection := db.Collection("myCollection1")

	// Insert a document to create the collection
	_, err = collection.InsertOne(context.TODO(), map[string]string{"name": "Alice", "age": "30"})
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("Collection created and document inserted!")
}
