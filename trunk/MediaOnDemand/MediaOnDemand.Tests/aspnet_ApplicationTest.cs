using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;
using System.Data.Linq;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for aspnet_ApplicationTest and is intended
    ///to contain all aspnet_ApplicationTest Unit Tests
    ///</summary>
    [TestClass()]
    public class aspnet_ApplicationTest
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
        ///A test for LoweredApplicationName
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LoweredApplicationNameTest()
        {
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.LoweredApplicationName = expected;
            actual = target.LoweredApplicationName;
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
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.Description = expected;
            actual = target.Description;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Users
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_UsersTest()
        {
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            EntitySet<aspnet_User> expected = null; // TODO: Initialize to an appropriate value
            EntitySet<aspnet_User> actual;
            target.aspnet_Users = expected;
            actual = target.aspnet_Users;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Roles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_RolesTest()
        {
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            EntitySet<aspnet_Role> expected = null; // TODO: Initialize to an appropriate value
            EntitySet<aspnet_Role> actual;
            target.aspnet_Roles = expected;
            actual = target.aspnet_Roles;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Paths
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PathsTest()
        {
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            EntitySet<aspnet_Path> expected = null; // TODO: Initialize to an appropriate value
            EntitySet<aspnet_Path> actual;
            target.aspnet_Paths = expected;
            actual = target.aspnet_Paths;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Memberships
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_MembershipsTest()
        {
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            EntitySet<aspnet_Membership> expected = null; // TODO: Initialize to an appropriate value
            EntitySet<aspnet_Membership> actual;
            target.aspnet_Memberships = expected;
            actual = target.aspnet_Memberships;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ApplicationName
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void ApplicationNameTest()
        {
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.ApplicationName = expected;
            actual = target.ApplicationName;
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
            aspnet_Application target = new aspnet_Application(); // TODO: Initialize to an appropriate value
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
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
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
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            string propertyName = string.Empty; // TODO: Initialize to an appropriate value
            target.SendPropertyChanged(propertyName);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for detach_aspnet_Users
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void detach_aspnet_UsersTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_User entity = null; // TODO: Initialize to an appropriate value
            target.detach_aspnet_Users(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for detach_aspnet_Roles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void detach_aspnet_RolesTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_Role entity = null; // TODO: Initialize to an appropriate value
            target.detach_aspnet_Roles(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for detach_aspnet_Paths
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void detach_aspnet_PathsTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_Path entity = null; // TODO: Initialize to an appropriate value
            target.detach_aspnet_Paths(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for detach_aspnet_Memberships
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void detach_aspnet_MembershipsTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_Membership entity = null; // TODO: Initialize to an appropriate value
            target.detach_aspnet_Memberships(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for attach_aspnet_Users
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void attach_aspnet_UsersTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_User entity = null; // TODO: Initialize to an appropriate value
            target.attach_aspnet_Users(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for attach_aspnet_Roles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void attach_aspnet_RolesTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_Role entity = null; // TODO: Initialize to an appropriate value
            target.attach_aspnet_Roles(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for attach_aspnet_Paths
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void attach_aspnet_PathsTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_Path entity = null; // TODO: Initialize to an appropriate value
            target.attach_aspnet_Paths(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for attach_aspnet_Memberships
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        [DeploymentItem("MediaOnDemand.dll")]
        public void attach_aspnet_MembershipsTest()
        {
            aspnet_Application_Accessor target = new aspnet_Application_Accessor(); // TODO: Initialize to an appropriate value
            aspnet_Membership entity = null; // TODO: Initialize to an appropriate value
            target.attach_aspnet_Memberships(entity);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for aspnet_Application Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_ApplicationConstructorTest()
        {
            aspnet_Application target = new aspnet_Application();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
