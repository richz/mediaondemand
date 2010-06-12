using MediaOnDemand;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using System;

namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for aspnet_MembershipTest and is intended
    ///to contain all aspnet_MembershipTest Unit Tests
    ///</summary>
    [TestClass()]
    public class aspnet_MembershipTest
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
        ///A test for UserId
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void UserIdTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            Guid expected = new Guid(); // TODO: Initialize to an appropriate value
            Guid actual;
            target.UserId = expected;
            actual = target.UserId;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordSalt
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PasswordSaltTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.PasswordSalt = expected;
            actual = target.PasswordSalt;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordQuestion
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PasswordQuestionTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.PasswordQuestion = expected;
            actual = target.PasswordQuestion;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordFormat
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PasswordFormatTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            target.PasswordFormat = expected;
            actual = target.PasswordFormat;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for PasswordAnswer
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PasswordAnswerTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.PasswordAnswer = expected;
            actual = target.PasswordAnswer;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for Password
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void PasswordTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.Password = expected;
            actual = target.Password;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for MobilePIN
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void MobilePINTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.MobilePIN = expected;
            actual = target.MobilePIN;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LoweredEmail
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LoweredEmailTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.LoweredEmail = expected;
            actual = target.LoweredEmail;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LastPasswordChangedDate
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LastPasswordChangedDateTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.LastPasswordChangedDate = expected;
            actual = target.LastPasswordChangedDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LastLoginDate
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LastLoginDateTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.LastLoginDate = expected;
            actual = target.LastLoginDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LastLockoutDate
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void LastLockoutDateTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.LastLockoutDate = expected;
            actual = target.LastLockoutDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for IsLockedOut
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void IsLockedOutTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            target.IsLockedOut = expected;
            actual = target.IsLockedOut;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for IsApproved
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void IsApprovedTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            bool expected = false; // TODO: Initialize to an appropriate value
            bool actual;
            target.IsApproved = expected;
            actual = target.IsApproved;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FailedPasswordAttemptWindowStart
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void FailedPasswordAttemptWindowStartTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.FailedPasswordAttemptWindowStart = expected;
            actual = target.FailedPasswordAttemptWindowStart;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FailedPasswordAttemptCount
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void FailedPasswordAttemptCountTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            target.FailedPasswordAttemptCount = expected;
            actual = target.FailedPasswordAttemptCount;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FailedPasswordAnswerAttemptWindowStart
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void FailedPasswordAnswerAttemptWindowStartTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.FailedPasswordAnswerAttemptWindowStart = expected;
            actual = target.FailedPasswordAnswerAttemptWindowStart;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for FailedPasswordAnswerAttemptCount
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void FailedPasswordAnswerAttemptCountTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            int expected = 0; // TODO: Initialize to an appropriate value
            int actual;
            target.FailedPasswordAnswerAttemptCount = expected;
            actual = target.FailedPasswordAnswerAttemptCount;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for Email
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void EmailTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.Email = expected;
            actual = target.Email;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for CreateDate
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void CreateDateTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            DateTime expected = new DateTime(); // TODO: Initialize to an appropriate value
            DateTime actual;
            target.CreateDate = expected;
            actual = target.CreateDate;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for Comment
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void CommentTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            target.Comment = expected;
            actual = target.Comment;
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for aspnet_User
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_UserTest()
        {
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
            aspnet_User expected = null; // TODO: Initialize to an appropriate value
            aspnet_User actual;
            target.aspnet_User = expected;
            actual = target.aspnet_User;
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
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
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
            aspnet_Membership target = new aspnet_Membership(); // TODO: Initialize to an appropriate value
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
            aspnet_Membership_Accessor target = new aspnet_Membership_Accessor(); // TODO: Initialize to an appropriate value
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
            aspnet_Membership_Accessor target = new aspnet_Membership_Accessor(); // TODO: Initialize to an appropriate value
            string propertyName = string.Empty; // TODO: Initialize to an appropriate value
            target.SendPropertyChanged(propertyName);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for aspnet_Membership Constructor
        ///</summary>
        [TestMethod()]
        [HostType("ASP.NET")]
        [UrlToTest("http://localhost:90")]
        public void aspnet_MembershipConstructorTest()
        {
            aspnet_Membership target = new aspnet_Membership();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
