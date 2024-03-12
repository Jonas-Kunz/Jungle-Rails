/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('/')
    cy.request("/cypress_rails_reset_state").then((res) => { 
      expect(res.status).to.eq(202);
    })
  })

  it("Logs user in through UI", () => {
    cy.contains("Login").click()
    cy.get('#email').type("email@email.com")
    cy.get('#password').type("1234567")
    cy.get("form").submit()
    cy.contains("Signed in as Jonas").should("be.visible")
  })

  it("Displays an Error message when given invalid credentials", () => {
    cy.contains("Login").click()
    cy.get('#email').type("email@email.com")
    cy.get('#password').type("12345213213")
    cy.get("form").submit()
    cy.contains("Email or Password incorrect").should("be.visible")
  })

  it("Displays Error messages when attempting to sign up with invalid credentials", () => {
    cy.contains("Sign up").click()
    cy.get("form").submit()
    cy.contains("The following errors prevented signup:").should("be.visible")
  })

  it("signs up and is redirected to home page with valid credentials", () => {
    cy.contains("Sign up").click()
    cy.get('#user_first_name').type("Dog")
    cy.get('#user_last_name').type("Man")
    cy.get('#user_email').type("cat@email.com")
    cy.get('#user_password').type("1111111")
    cy.get('#user_password_confirmation').type("1111111")
    cy.get('.btn').click()
    cy.contains("Signed in as Dog").should("be.visible")
  })
})