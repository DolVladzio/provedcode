describe('ProvedCode infrasrtucture tests', () => {
  it('Start page successfully loads', () => {
    cy.visit('/');
    // == Buttons =====================================
    cy.get('button[name="Header_btn__dJRZu"]').click();
    cy.get('button[name="AuthModal_header_btn__sPgN2"]').click();
    // == Register info ===============================
    cy.get('input[name="first_name"]').type('Vladzio');
    cy.get('input[name="last_name"]').type('Dolynka');

    cy.get('input[name="login"]').type('dolynkavladzio@gmail.com');

    cy.get('input[name="specialization"]').type('DevOps');

    cy.get('input[name="password"]').type('Programist');
    cy.get('input[name="repeated_password"]').type('Programist');
    // == Button ======================================
    cy.get('button[name="Register_btn__Ctx1+"]').click();
  });
});
