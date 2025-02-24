describe('ProvedCode infrasrtucture tests', () => {
  it('Start page successfully loads', () => {
    cy.visit('/');
    // == Buttons =====================================
    cy.contains('button', 'Login / Register').click();
    cy.contains('button', 'Register').click();
    // // == Register info ===============================
    // cy.get('input[name="first_name"]').type('Vladzio');
    // cy.get('input[name="last_name"]').type('Dolynka');

    // cy.get('input[name="login"]').type('dolynkavladzio@gmail.com');

    // cy.get('input[name="specialization"]').type('DevOps');

    // cy.get('input[name="password"]').type('Programist');

    // cy.get('input[name="repeated_password"]').type('Programist');

    // cy.get('button[name="Register_btn__Ctx1+"]').click();
  });
});
