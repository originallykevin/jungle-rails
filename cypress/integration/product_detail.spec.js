describe('product page testing', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("There is a category of 'Evergreens'", () => {
    cy
      .get('.nav-item')
      .contains('Evergreens')
      .click();
  });

});