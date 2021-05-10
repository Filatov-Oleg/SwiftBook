//
//  ItemsTableModel.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import Foundation

struct ProductModel {
    var imageProduct: String
    var nameProduct: String
    var ingredients: String
    var price: Int
    
    static func makeExample() -> [ProductModel] {
        return [ProductModel(imageProduct: "Pizza1", nameProduct: "Ветчина и грибы", ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza2", nameProduct: "Баварские колбаски", ingredients: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza3", nameProduct: "Нежный лосось", ingredients: "Лосось, томаты черри, моцарелла, соус песто", price: 345),
                ProductModel(imageProduct: "Pizza4", nameProduct: "Пицца четыре сыра", ingredients: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 345),
                ProductModel(imageProduct: "Pizza1", nameProduct: "Ветчина и грибы", ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza2", nameProduct: "Баварские колбаски", ingredients: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza3", nameProduct: "Нежный лосось", ingredients: "Лосось, томаты черри, моцарелла, соус песто", price: 345),
                ProductModel(imageProduct: "Pizza4", nameProduct: "Пицца четыре сыра", ingredients: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 345),
                ProductModel(imageProduct: "Pizza1", nameProduct: "Ветчина и грибы", ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza2", nameProduct: "Баварские колбаски", ingredients: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza3", nameProduct: "Нежный лосось", ingredients: "Лосось, томаты черри, моцарелла, соус песто", price: 345),
                ProductModel(imageProduct: "Pizza4", nameProduct: "Пицца четыре сыра", ingredients: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 345),
                ProductModel(imageProduct: "Pizza1", nameProduct: "Ветчина и грибы", ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza2", nameProduct: "Баварские колбаски", ingredients: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 345),
                ProductModel(imageProduct: "Pizza3", nameProduct: "Нежный лосось", ingredients: "Лосось, томаты черри, моцарелла, соус песто", price: 345),
                ProductModel(imageProduct: "Pizza4", nameProduct: "Пицца четыре сыра", ingredients: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 345),]
    }
}

