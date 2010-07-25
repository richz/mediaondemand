using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Data.Linq.Mapping;
using System.Data;
using System.Data.Linq;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for UserManagementDataContextTest and is intended
    ///to contain all UserManagementDataContextTest Unit Tests
    ///</summary>
    [TestClass()]
    public class UserManagementDataContextTest
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
        ///A test for aspnet_WebEvent_Events
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_WebEvent_EventsTest()
        {
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_WebEvent_Event> actual;
            actual = target.aspnet_WebEvent_Events;
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
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_UsersInRole> actual;
            actual = target.aspnet_UsersInRoles;
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
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_User> actual;
            actual = target.aspnet_Users;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_SchemaVersions
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_SchemaVersionsTest()
        {
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_SchemaVersion> actual;
            actual = target.aspnet_SchemaVersions;
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
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_Role> actual;
            actual = target.aspnet_Roles;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Profiles
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_ProfilesTest()
        {
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_Profile> actual;
            actual = target.aspnet_Profiles;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_PersonalizationPerUsers
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PersonalizationPerUsersTest()
        {
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_PersonalizationPerUser> actual;
            actual = target.aspnet_PersonalizationPerUsers;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_PersonalizationAllUsers
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_PersonalizationAllUsersTest()
        {
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_PersonalizationAllUser> actual;
            actual = target.aspnet_PersonalizationAllUsers;
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
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_Path> actual;
            actual = target.aspnet_Paths;
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
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_Membership> actual;
            actual = target.aspnet_Memberships;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_Applications
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_ApplicationsTest()
        {
            UserManagementDataContext target = new UserManagementDataContext(); // TODO: Initialize to an appropriate value
            Table<aspnet_Application> actual;
            actual = target.aspnet_Applications;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for UserManagementDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserManagementDataContextConstructorTest4()
        {
            string connection = string.Empty; // TODO: Initialize to an appropriate value
            UserManagementDataContext target = new UserManagementDataContext(connection);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for UserManagementDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserManagementDataContextConstructorTest3()
        {
            UserManagementDataContext target = new UserManagementDataContext();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for UserManagementDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserManagementDataContextConstructorTest2()
        {
            IDbConnection connection = null; // TODO: Initialize to an appropriate value
            UserManagementDataContext target = new UserManagementDataContext(connection);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for UserManagementDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserManagementDataContextConstructorTest1()
        {
            IDbConnection connection = null; // TODO: Initialize to an appropriate value
            MappingSource mappingSource = null; // TODO: Initialize to an appropriate value
            UserManagementDataContext target = new UserManagementDataContext(connection, mappingSource);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for UserManagementDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserManagementDataContextConstructorTest()
        {
            string connection = string.Empty; // TODO: Initialize to an appropriate value
            MappingSource mappingSource = null; // TODO: Initialize to an appropriate value
            UserManagementDataContext target = new UserManagementDataContext(connection, mappingSource);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
