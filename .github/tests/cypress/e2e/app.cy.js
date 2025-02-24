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
    // == First/Last names =============================
    cy.get('.AuthModal_modal__VOT9o input[name="first_name"]')
      .should('be.visible')
      .type('Vladzio');

    cy.get('.AuthModal_modal__VOT9o input[name="last_name"]')
    .should('be.visible')
    .type('Dolynka');

    // cy.get('input[name="login"]').type('dolynkavladzio@gmail.com');

    // cy.get('input[name="specialization"]').type('DevOps');

    // cy.get('input[name="password"]').type('Programist');

    // cy.get('input[name="repeated_password"]').type('Programist');

    // cy.get('button[name="Register_btn__Ctx1+"]').click();
  });
});
