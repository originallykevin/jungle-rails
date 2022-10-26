describe('product page testing', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("There is a 0 items in cart initially", () => {
    cy
      .get('.nav-item')
      .get('.nav-link')
      .contains('My Cart (0)');
  });

  it("Increase cart by 1 if product added", () => {
    cy
      .get(".products article")
      .should("be.visible");

    // click add to cart
    cy
      .contains('Add')
      .click({ force: true });

    // check if cart increase to 1
    cy
      .get('.nav-item')
      .get('.nav-link')
      .contains('My Cart (1)');
  });
});