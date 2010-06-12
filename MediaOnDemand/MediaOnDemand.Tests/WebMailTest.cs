using MediaOnDemandLibrary;
using Microsoft.VisualStudio.TestTools.UnitTesting;
namespace MediaOnDemand.Tests
{
    
    
    /// <summary>
    ///This is a test class for WebMailTest and is intended
    ///to contain all WebMailTest Unit Tests
    ///</summary>
    [TestClass()]
    public class WebMailTest
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
        ///A test for SMTP
        ///</summary>
        [TestMethod()]
        public void SMTPTest()
        {
            string to = "email@gmail.com"; // TODO: Initialize to an appropriate value
            string bcc = to; // TODO: Initialize to an appropriate value
            string subject = "subject"; // TODO: Initialize to an appropriate value
            string body = "body"; // TODO: Initialize to an appropriate value
            WebMail.SMTP(to, bcc, subject, body);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for SendEmail
        ///</summary>
        [TestMethod()]
        public void SendEmailTest()
        {
            string emailRecipient = "email@gmail.com"; // TODO: Initialize to an appropriate value
            string bcc = emailRecipient; // TODO: Initialize to an appropriate value
            string emailSubject = "subject"; // TODO: Initialize to an appropriate value
            string body = "body"; // TODO: Initialize to an appropriate value
            WebMail.SendEmail(emailRecipient, bcc, emailSubject, body);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for WebMail Constructor
        ///</summary>
        [TestMethod()]
        public void WebMailConstructorTest()
        {
            WebMail target = new WebMail();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
