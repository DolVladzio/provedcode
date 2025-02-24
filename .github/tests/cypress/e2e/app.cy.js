describe('ProvedCode infrasrtucture tests', () => {
  it('Start page successfully loads', () => {
    cy.visit('/');
    // == Buttons =====================================
    cy.contains('button', 'Login / Register').click();

    cy.get('.AuthModal_modal__VOT9o').should('be.visible');

    cy.get('.AuthModal_modal__VOT9o button')
      .contains('Register')
      .should('be.visible')
      .click();
    // == Register info ================================
    cy.get('.AuthModal_modal__VOT9o input[name="first_name"]')
      .should('be.visible')
      .type('Vladzio');

    cy.get('.AuthModal_modal__VOT9o input[name="last_name"]')
    .should('be.visible')
    .type('Dolynka');

    cy.get('.AuthModal_modal__VOT9o input[name="login"]')
    .should('be.visible')
    .type('dolynkavladzio@gmail.com');

    cy.get('.AuthModal_modal__VOT9o input[name="specialization"]')
    .should('be.visible')
    .type('DevOps');
    // == Password ======================================
    cy.get('.AuthModal_modal__VOT9o input[name="password"]')
    .should('be.visible')
    .type('Programist');

    cy.get('.AuthModal_modal__VOT9o input[name="repeated_password"]')
    .should('be.visible')
    .type('Programist');
    // == Button 'Login' ================================
    cy.get('.AuthModal_modal__VOT9o button')
      .contains('Login')
      .should('be.visible')
      .click();
  });
});
