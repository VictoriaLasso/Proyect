/*
 Project: adminCMS
 Authors: George admin
 */

// Create the tests for the JavaScript functionality

/*
 * Testing the functionality of the Project welcome
 */
describe('Admin Tests', function () {
    var projectWelcomeTest;

    beforeEach(function () {
        projectWelcomeTest = admin.sampleTest.simpleTest('Admin');
    });

    it('Project should say welcome', function () {
        expect(projectWelcomeTest).toEqual('Skeleton Project is starting. Welcome!');
    });
});