using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System.Data.Linq.Mapping;
using System.Data;
using System.Data.Linq;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for StorageMediaDataContextTest and is intended
    ///to contain all StorageMediaDataContextTest Unit Tests
    ///</summary>
    [TestClass()]
    public class StorageMediaDataContextTest
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
        ///A test for UserAccountSettings
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserAccountSettingsTest()
        {
            StorageMediaDataContext target = new StorageMediaDataContext(); // TODO: Initialize to an appropriate value
            Table<UserAccountSetting> actual;
            actual = target.UserAccountSettings;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for StoredMedias
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void StoredMediasTest()
        {
            StorageMediaDataContext target = new StorageMediaDataContext(); // TODO: Initialize to an appropriate value
            Table<StoredMedia> actual;
            actual = target.StoredMedias;
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for StorageMediaDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void StorageMediaDataContextConstructorTest4()
        {
            string connection = string.Empty; // TODO: Initialize to an appropriate value
            StorageMediaDataContext target = new StorageMediaDataContext(connection);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for StorageMediaDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void StorageMediaDataContextConstructorTest3()
        {
            StorageMediaDataContext target = new StorageMediaDataContext();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for StorageMediaDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void StorageMediaDataContextConstructorTest2()
        {
            IDbConnection connection = null; // TODO: Initialize to an appropriate value
            StorageMediaDataContext target = new StorageMediaDataContext(connection);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for StorageMediaDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void StorageMediaDataContextConstructorTest1()
        {
            IDbConnection connection = null; // TODO: Initialize to an appropriate value
            MappingSource mappingSource = null; // TODO: Initialize to an appropriate value
            StorageMediaDataContext target = new StorageMediaDataContext(connection, mappingSource);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }

        /// <summary>
        ///A test for StorageMediaDataContext Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void StorageMediaDataContextConstructorTest()
        {
            string connection = string.Empty; // TODO: Initialize to an appropriate value
            MappingSource mappingSource = null; // TODO: Initialize to an appropriate value
            StorageMediaDataContext target = new StorageMediaDataContext(connection, mappingSource);
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
