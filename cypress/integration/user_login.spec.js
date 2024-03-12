/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("Logs user in through UI", () => {
    cy.contains("Login").click()
    cy.get('#email').type("Goat@dog.com")
    cy.get('#password').type("123123123")
    cy.get("form").submit()
  })
})