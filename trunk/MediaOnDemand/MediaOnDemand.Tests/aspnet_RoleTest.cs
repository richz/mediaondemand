using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;
using System.Data.Linq;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for aspnet_RoleTest and is intended
    ///to contain all aspnet_RoleTest Unit Tests
    ///</summary>
    [TestClass()]
    public class aspnet_RoleTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for RoleName
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void RoleNameTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.RoleName = expected;
            actual = target.RoleName;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for RoleId
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void RoleIdTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            Guid expected = new Guid(); // TODO: Initialize to an appropriate value
            Guid actual;
            target.RoleId = expected;
            actual = target.RoleId;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LoweredRoleName
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LoweredRoleNameTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.LoweredRoleName = expected;
            actual = target.LoweredRoleName;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for Description
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void DescriptionTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.Description = expected;
            actual = target.Description;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_UsersInRoles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_UsersInRolesTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            EntitySet<aspnet_UsersInRole> expected = null; // TODO: Initialize to an appropriate value
            EntitySet<aspnet_UsersInRole> actual;
            target.aspnet_UsersInRoles = expected;
            actual = target.aspnet_UsersInRoles;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Application
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_ApplicationTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            aspnet_Application expected = null; // TODO: Initialize to an appropriate value
            aspnet_Application actual;
            target.aspnet_Application = expected;
            actual = target.aspnet_Application;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ApplicationId
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void ApplicationIdTest()
        {
            aspnet_Role target = new aspnet_Role(); // TODO: Initialize to an appropriate value
            Guid expected = new Guid(); // TODO: Initialize to an appropriate value
            Guid actual;
            target.ApplicationId = expected;
            actual = target.ApplicationId;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for SendPropertyChanging
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void SendPropertyChangingTest()
        {
            aspnet_Role_Accessor target = new aspnet_Role_Accessor(); // TODO: Initialize to an appropriate value
            target.SendPropertyChanging();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for SendPropertyChanged
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void SendPropertyChangedTest()
        {
            aspnet_Role_Accessor target = new aspnet_Role_Accessor(); // TODO: Initialize to an appropriate value
            string propertyName = string.Empty; // TODO: Initialize to an appropriate value
            target.SendPropertyChanged(propertyName);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for detach_aspnet_UsersInRoles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void detach_aspnet_UsersInRolesTest()
        {
            aspnet_Role_Accessor target = new aspnet_Role_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_UsersInRole entity = null; // TODO: Initialize to an appropriate value
            target.detach_aspnet_UsersInRoles(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for attach_aspnet_UsersInRoles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void attach_aspnet_UsersInRolesTest()
        {
            aspnet_Role_Accessor target = new aspnet_Role_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_UsersInRole entity = null; // TODO: Initialize to an appropriate value
            target.attach_aspnet_UsersInRoles(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for aspnet_Role Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_RoleConstructorTest()
        {
            aspnet_Role target = new aspnet_Role();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
