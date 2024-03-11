/// <reference types="cypress" />

describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('displays the home page', () => {
    cy.get(".products article").should("be.visible");
  })
})