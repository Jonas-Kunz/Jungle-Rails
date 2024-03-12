/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('displays the home page', () => {
    cy.get(".products article").should("be.visible");
  })

  it("Navigates from the home page to a product and adds it to cart, cart count increase by one", () => {
    cy.contains("Scented Blade").click()
    cy.contains("My Cart (0)").should("be.visible")
    cy.get('.btn').should("be.visible").click()
    cy.contains("My Cart (1)").should("be.visible")
  })

  it("Adds product to cart from home page", () => {
    cy.contains("My Cart (0)").should("be.visible")
    cy.get("form").first().submit()
    cy.contains("My Cart (1)").should("be.visible")
  })
  
})