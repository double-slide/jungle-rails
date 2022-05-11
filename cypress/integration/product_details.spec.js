describe("", () => {

  it("should visit the homepage", () => {
    cy.visit("/");
  });

  it("should see products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should see 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should click on the first product", () => {
    cy.get("article")
    .first()
    .click()
  });
  

});