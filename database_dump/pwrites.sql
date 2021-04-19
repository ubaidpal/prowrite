-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2021 at 07:50 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwrites`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `additional_services`
--

CREATE TABLE `additional_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` double(8,2) NOT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicants`
--

CREATE TABLE `applicants` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `applicant_status_id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `referral_source_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_statuses`
--

CREATE TABLE `applicant_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `applicant_statuses`
--

INSERT INTO `applicant_statuses` (`id`, `name`) VALUES
(1, 'Applied'),
(2, 'Reviewed'),
(3, 'Screen'),
(4, 'Need to schedule an interview'),
(5, 'Interview scheduled'),
(6, 'Interviewed'),
(7, 'Offer'),
(8, 'Hired'),
(9, 'Candidate Widthdrew'),
(10, 'On Hold'),
(11, 'Reject');

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `actual_updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `type`, `slug`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'regular', 'how-it-works', 'How it works', '<h5>1. FILL IN OUR SIMPLE ORDER FORM</h5>\r\n                        <p>It has never been easier to place your order. Fill in the initial requirements in the small order form located on the home page and press “continue” button to proceed to the main order form or press “order” button in the header menu. Starting from there let our system intuitively guide you through all steps of ordering process. Submit detailed paper instructions, upload necessary files if needed and provide your contact information – you are almost done!</p>\r\n                        <br><br>\r\n <h5>2. PROCEED WITH THE PAYMENT</h5>\r\n                        <p>All your payments are processed securely through PayPal. This enables us to guarantee a 100% security of your funds and process payments swiftly.</p>\r\n                        <br><br>\r\n                        <h5>3. WRITER ASSIGNMENT</h5>\r\n                        <p>Next, we match up your order details with the most qualified freelance writer in your field. This process can take a few minutes up to a few hours. However, it highly depends on your deadline. Most of the time, we will assign your writer as quickly as possible to ensure that your order is completed on time.</p>\r\n                        <br><br>\r\n                       <h5>4. WRITING PROCESS</h5>\r\n                        <p>Once we have found the most suitable writer for your assignment, they start reviewing your requirements for the paper. If the designated specialist has questions or needs clarifications, we will contact you right away. In other case, they start working on a masterpiece just for you!</p>\r\n                        <br><br>\r\n                        <h5>5. DELIVERY</h5>\r\n                        <p>Once finished, your final paper will be available for download through your personal dashboard. You will also receive an email notification with a copy of your paper attached to it. Sometimes, the writer may leave a note for you about the order in case there is any additional information that they need to give you.</p>', NULL, NULL),
(2, 'regular', 'faq', 'F.A.Q. — Frequently Asked Questions', '<h5>How does ProWriter service work?</h5>\r\n<div>\r\nTo learn about how our service works, please visit <a href=\"http://localhost:8000/how-it-works\">How It Works</a> page where you can read a detailed explanation of our features, along with a step-by-step guide.\r\n</div>\r\n\r\n<br><br>\r\n\r\n<h5>How do I place an order</h5>\r\n<div>To place an order, simply navigate over to the Order page and fill in the required information concerning your particular order. Alternatively, you can place your order over the phone or by using either the Live Chat or Email feature at the top of the website or Contacts section.</div>\r\n', NULL, NULL),
(3, 'legal', 'money-back-guarantee', 'Money Back Guarantee', '<p>Thank you for choosing our writing services. We also want to make sure you have a rewarding experience while you’re exploring, evaluating, and purchasing our products. The main thing to remember is that by placing an order at <a href=\"/\" target=\"_blank\">prowriters.com</a>, you agree to the terms set forth below along with <a href=\"/terms-and-conditions\" target=\"_blank\">Terms and Conditions</a> and <a href=\"/privacy-policy\" target=\"_blank\">Privacy Policy</a>.</p><p>We understand, however, that sometimes a product may not be what you expected it to be. In this unlikely event, we invite you to review the following terms related to returning a product:</p><p><br></p><ol><li>There is a payment issue (identical orders, double payment, etc.);</li><li>We are not able to find a writer for your order;</li><li>In case the order is late, it can be cancelled. Customer gives up all rights to use any material delivered during the order progress. Writer stops working on the paper. (Does not apply to revisions)</li><li>Substantial level of plagiarized material (more than 10%) is detected in the paper and an official plagiarism report is presented;</li><li>The research is off-topic or does not match the requirements that were clearly stated by the client in the order description (such cases fall under QAD jurisdiction).</li></ol><p><br></p><p>Kindly be informed that if you are not satisfied with the overall quality of the paper you have received, you may request a partial or full refund. All the refund requests are processed on the case-to-case basis, which means that every paper is unique and demands a flexible approach. In this case, we will send your paper to our independent Quality Assurance Department to have it graded and proofread.You may only apply for a refund within 14 days after the deadline chosen in the order if your paper is less than 30 pages, or 30 days if the paper is 30+ pages long. The grading process takes up to 48 hours. Our Quality Assurance Department calculates the percentage of incorrect content and evaluates an amount of refund respectively.</p><p><br></p><p>There are several important points you need to consider when setting the order on dispute:</p><p><br></p><ol><li>In case of a dispute, you have to provide strong reasons, facts, and examples to back up your claim;</li><li>It may take up to 48 hours for us to resolve the dispute: communicate with the writer, send the paper for evaluation, etc. Sometimes we may ask for additional materials or evidence to support your request;</li><li>Each case is reviewed individually; every decision concerning refund is taken after careful consideration. The refund percentage is suggested independently in each case.</li></ol><p><br></p><p>In case you cancel your order when the writer has already been assigned to it, we will request the completed draft from the writer (which is provided within 3 hours after your request is made) and decide on the refund amount based on the latter. Please note, that the exact percentage of refund is decided individually for every order depending on the level of completion. Along with a refund, a client is eligible to receive an unfinished paper that had been written by the time a cancellation request was received.Please note that as soon as we assign the writer to your order, you cannot ask for any changes to the initial instructions. If you do come up with any kind of changes to the initial instructions, we reserve ourselves the right to take a decision on taking into account those changes or not. When asking for full refund, you don\'t have the right to use the paper and all the additional materials we provided in the course of work. All these materials become the property of our company, and we reserve the right to publish the paper online for commercial purposes. We do not keep any kind of essay databases and ‘publish on-line\' means that if the paper is Googled or checked with any kind of plagiarism software, it will link back to our website. It may also be published as content or as a sample essay. This is done to protect our writers’ work in those cases when a customer claims a refund for the paper that has already been completed. Please, be aware that we do not guarantee any particular grade, which is why you are not eligible for a refund in case you were poorly assessed.</p><p><br></p><p>We encourage our customers to contact our Customer Support Team VIA the Phone (toll free), Live Chat or Email in case you believe you can qualify for a refund or have other issues concerning your order. We shall review your case carefully and come up with the most justified solution.</p><p><br></p><p>Please note that if you live on the territory of the European Union and paid VAT in the process of payment transaction, you do not receive it back with a refund. You get back only the money or a percent of the price stated in the Prices section of the website. VAT is non-refundable.</p>', NULL, NULL),
(4, 'legal', 'privacy-policy', 'Privacy Policy', '<p>This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use <a href=\"https://prowriters.com\" target=\"_blank\">https://prowriters.com</a> (\"us\", \"we\", \"our\", the \"Service\") and the choices you have associated with that data.</p><p>We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, accessible from <a href=\"https://prowriters.com\" target=\"_blank\">prowriters.com</a></p><p><br></p><h2><br></h2><h2>Definitions</h2><h4>Service</h4><p>Service is the <a href=\"https://prowriters.com\" target=\"_blank\">https://prowriters.com</a> website (prowriters.com).</p><h5>Personal Data</h5><p>Personal Data means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).</p><h5>Usage Data</h5><p>Usage Data is data collected automatically either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p><h5>Cookies</h5><p>Cookies are small pieces of data stored on your device (computer or mobile device).</p><h5>Data Controller</h5><p>Data Controller means the natural or legal person who (either alone or jointly or in common with other persons) determines the purposes for which and the manner in which any personal information are, or are to be, processed.</p><p>For the purpose of this Privacy Policy, we are a Data Controller of your Personal Data.</p><h5>Data Processors (or Service Providers)</h5><p>Data Processor (or Service Provider) means any natural or legal person who processes the data on behalf of the Data Controller.</p><p>We may use the services of various Service Providers in order to process your data more effectively.</p><h5>Data Subject (or User)</h5><p>Data Subject is any living individual who is using our Service and is the subject of Personal Data.</p><h2><br></h2><h2><br></h2>', NULL, NULL),
(5, 'legal', 'revision-policy', 'Revision Policy', 'Although we provide premium quality academic assistance, it may be necessary to have the delivered product revised. You are entitled to request as many revisions as may be required to make the paper consistent and compliant with your instructions. We offer a 14-day Revision Period for papers less than 30 pages and a 30-day period for papers more than 30 pages. In case a request for revision is not submitted within the stated period, we accept the fact that the client is satisfied with the paper and requires no further actions to be taken in regards to the paper unless extra payment is provided or a new order is placed.<p>To submit the revision request, you just have to log into the account, click on \"VIEW\" on the required order and you will find a big button \"SUBMIT FOR REVISION\". There you have to provide all the requirements for the writer.</p>\r\n<p>Every client is eligible for a revision if the revision request adheres to the following requirements:</p> \r\n<ul>\r\n<li>The revision instructions you submit must be absolutely clear. In addition, they must not contradict the initial guidelines. Should our Quality Assurance Department decide that your original guidelines were followed, your request for revision shall not be processed. In this case, you will need to make a new order for proofreading/editing.</li>\r\n<li>No changes of the paper are allowed to be made by the customer before revision takes place.</li>\r\n<li>No other general terms and conditions are violated.</li>\r\n<li>48 hours (usually much less) should be allowed for the revision to be processed.</li>\r\n</ul>\r\n', NULL, NULL),
(6, 'legal', 'disclaimer', 'Disclaimer', '<h5>SERVICE AVAILABILITY</h5><p>While our writing services shall endeavor to make this site available at all times, we will not be liable if, for any reason, the site is unavailable for any period of time. Access to this site may be suspended at any time without prior notice being given. We are not liable for any damages arising in contract, tort or otherwise from the use of or inability to use this site or any material it contains, or from any action or decision taken as a result of using the site. The materials on this site comprise our views; they do not constitute legal or other professional advice. You should consult your professional adviser for legal or other advice.</p><h5>LINKS DISCLAIMER</h5><p>This site offers links to other sites, thereby enabling you to leave it and go directly to the linked site. We are not responsible for the content of any linked site or any link on a linked site. We are not responsible for any transmission received from any linked site. The links are provided to bring visitors to our website, and the inclusion of a link does not imply that we endorse that information or have approved the linked site.</p><h5>USE OF RECEIVED PIECES OF WRITING</h5><p>You may not put your name on the delivered pieces of writing (hereinafter referred to as \"Product\"). All Products and/or other written materials delivered to you are for research and/or reference only. We do not condone, encourage, or knowingly take part in plagiarism or any other acts of academic fraud or dishonesty. We strongly adhere to and abide by all copyright laws, and will not knowingly allow any Customer to commit plagiarism or violate copyright laws. You agree that any Product and/or other written material delivered to you is provided only as a model, example document for research use, and any text and/or ideas from our document that you borrow, reference, refer to, or otherwise use in any way in your own original paper must be properly cited and attributed to this Website.</p><p>Neither our company nor any of our affiliates and/or partners shall be liable for any unethical, inappropriate, illegal, or otherwise wrongful use of the Products and/or other written material received from our Website. This includes plagiarism, lawsuits, poor grading, expulsion, academic probation, loss of scholarships/awards/grants/prizes/titles/positions, failure, suspension, or any other disciplinary or legal actions. The buyer of material from our Website is solely responsible for any and all disciplinary actions arising from the improper, unethical, and/or illegal use of the material.</p><p>The company will not be liable for any delays or technical problems in the delivery of the Product resulting from any malfunction of Customer\'s mail-server or Customer\'s Internet Service Provider.</p><p>We don\'t guarantee any particular grade, and you cannot ask for a refund in case you were poorly assessed.</p><h5>PLAGIARISM</h5><p>The plagiarism level that is regarded as acceptable by us is below 10%. If the plagiarism level is higher, you have the right to ask for a revision or a refund. For additional information considering these issues, you are free to view our&nbsp;<a href=\"/money-back-guarantee\" target=\"_blank\">Money Back Guarantee</a>&nbsp;and&nbsp;<a href=\"/revision-policy\" target=\"_blank\">Revision policy</a>. Please note that bibliographical references (in-text referencing and the bibliography page at the end of the paper) and cliched phrases (idioms, standard phrases, connectors and other frequently used phrases) shall not be regarded as plagiarism and shall not be included in the plagiarism level calculation.</p><h5>PAYMENT</h5><p>The prices you see in the Prices section of the website do not include VAT. It is charged only to customers from the European Union. It will be added to the cost of the order in the process of payment transaction. VAT is non-refundable.</p><h5>PROOFREADING</h5><p>If you place an order for proofreading/editing, you cannot expect the writer to change more than 30% of the text. Proofreading is essentially us checking the work for you for any spelling, grammatical, punctuation, and stylistic errors or plagiarized parts (we scan every submitted document for plagiarism). You also cannot expect the writer to rewrite or create a brand new piece from what you upload. Nor can you ask the writer to rewrite an online article and still be charged for proofreading.</p>', NULL, NULL),
(7, 'legal', 'terms-and-conditions', 'Terms and Conditions', '<div><h2>Terms of use</h2><p>Your use of this website constitutes your agreement with the terms and conditions as stated below. If you disagree with any of these terms and conditions, do not use this website. If you are an underage person, you are not allowed to access or use this website. You further acknowledge and agree that you must be of legal age to purchase any of our products or services available on this website. By submitting the order form and/or payment, you confirm that you have fully read, understood and agreed to be legally bound by these terms and conditions, which form the entire agreement between this web site and you.</p><h2>Interpretation</h2><p>In this document: \"Website\" means prowriters.com, \"Customer\", \"You\" or \"Yours\" mean and refer to you and/or any other person submitting the Order to the Website on your behalf. \"Company\", \"We\" or \"Our\" mean and refer to prowriters.com, Inc. \"Product\" means an original essay, paper, and/or other written Product that is drafted and delivered to the Customer in accordance with his/her Order. \"Order\" means a written order of the standard electronic form that is filled and submitted online by the Customer to Our Website. Order specifies the scope of work and other requirements of the Customer regarding the Product.</p><h2>Our services</h2><p>By submitting an Order and/or payment, You are purchasing the Product for Your personal, noncommercial use only. All Products are drafted by freelance writers who transferred all the rights and ownership regarding the Products to the Company. You can find more details about Our services on the page&nbsp;<a href=\"/how-it-works\">How it works</a>. It is Your obligation to read these Terms and Conditions and the page&nbsp;<a href=\"/how-it-works\"> How it works </a>&nbsp;before submitting any Order and/or payment to this Website.</p><h2>Refunds</h2><p>The Products are refundable only in the cases stated in the&nbsp;<a href=\"/money-back-guarantee\">Money Back Guarantee</a>&nbsp;document. Please, view it for additional information on this issue. Mind that if You live in the European Union and have paid VAT in the process of payment transaction, You do not receive it back with a refund. You get back only the money or a percent of the price stated in the&nbsp;<a href=\"/prices\">Prices</a>&nbsp;section of the Website. VAT is non-refundable. Please note that Discounts are not subject to refunds either.</p><h2>Copyright &amp; personal use</h2><p>The Products delivered to You are completely original. The full copyright to the Products and other materials delivered to You is retained by the Company and/or its affiliates and partners. Your use of the delivered Products and other materials available from this Website is for Your personal, noncommercial use only. You shall not distribute, publish, transmit, modify, display or create derivative works from or exploit the Products and/or contents of this Website without a prior written consent of the Company. You shall indemnify, defend and hold harmless the Company for any and all unauthorized uses You may make of any material available from this Website. Any unauthorized use of the delivered Products and/or content of this Website may subject You to civil or criminal penalties.</p><h2>No plagiarism</h2><p>You acknowledge that the Company reserves the right to cancel any agreement, contract or arrangement with any person who condones or attempts to pass plagiarized Product as original when asking for editing or proofreading. You also agree that any Product delivered by the Company may not be passed to third parties or distributed in any way for payment or for any other purpose. You also acknowledge that if the Company suspects that the delivered Product has been distributed or has been used by You in any form of plagiarism, the Company reserves the right to refuse to carry out any further work and services for You and subject You to criminal or civil penalties. You may not put Your name on the delivered Product. All the Products and/or other written materials delivered to You are for research and/or reference only. We do not condone, encourage or knowingly take part in plagiarism or any other acts of academic fraud or dishonesty. We strongly adhere to and abide by all copyright laws and will not knowingly allow any Customer to commit plagiarism or violate copyright laws. You agree that any Product and/or other written material delivered to You is provided only as a model, example document for research use, and any text and/or ideas from Our document that You borrow, reference, refer to or otherwise use in any way in Your own original paper must be properly cited and attributed to this Website. Neither the Company nor any of its affiliates and/or partners shall be liable for any unethical, inappropriate, illegal or otherwise wrongful use of the Products and/or other written material received from Our Website. This includes plagiarism, lawsuits, poor grading, expulsion, academic probation, loss of scholarships/awards/grants/prizes/titles/positions, failure, suspension or any other disciplinary or legal actions. The buyer of the material from this Website is solely responsible for any and all disciplinary actions arising from the improper, unethical and/or illegal use of the material. The plagiarism level that is regarded as acceptable by Us is below 10%. In case the plagiarism level is higher, You have the right to ask for a revision or refund. For additional information considering these issues, You are free to view Our&nbsp;<a href=\"/money-back-guarantee\">Money Back Guarantee</a>&nbsp;and&nbsp;<a href=\"/revision-policy\">Revision Policy</a>. Please mind that the bibliographical references (in-text referencing and the bibliography page at the end of the papers) as well as cliched phrases (idioms, standard phrases, connectors, and other frequently used phrases) shall not be regarded as plagiarism and shall not be included in the plagiarism level calculation.</p><h2>Plagiarism Report</h2><p>We are happy to introduce our new Additional paid feature - Plagiarism checker which is available for you on the <a href=\"/order\">Order form page</a>. We believe that this option will help to reach the best from our cooperation.</p><p>Please review our terms and conditions below to know in which cases it’s eligible for a refund request from client’sside:</p><ul class=\"list-normal\"><li>upon choosing the Plagiarism checker feature initially - it will be already included for all future edits ofyour paper which can be done due to our Revision Policy.</li><li>while placing an order for the Editing option and choosing Plagiarism checker option - we are forced to checkthe originally uploaded paper by the customer to prevent any misunderstandings in the future;</li></ul><p>Requests are accepted either within 14 days of delivery for papers that are less than 30 pages long or within 30daysof delivery for papers that exceed 30 pages.</p><p>At writemypaper4me.org (any other websites), we believe in high-quality cooperation and clear Polices for customers.Should you have any questions - please, do not hesitate to contact our helpful Customer Support team via phone,email, or Live Chat and we will be more than happy to answer all your questions and find the best solutions for bothsides.</p><h2>Our guarantees</h2><p>We guarantee that the paper\'s plagiarism level is lower than 10% (not including bibliographical references and cliched phrases); that we follow all your instructions; that we follow the formatting requirements that you state; that we conduct the necessary research; that we comply with the formal standard English style. We don\'t guarantee any particular grade, and You cannot ask for a refund in case You received an unsatisfactory mark.</p><h2>Order placement</h2><p>When You decide to place an Order or inquiry (quote) on the Website, You agree to fill in an online form. There, You will be asked to provide certain personal information necessary to perform the Order. The Company shall on no condition disclose the information to any third parties. For further reference, please view our&nbsp;<a href=\"/privacy-policy\">Privacy Policy</a>.</p><h2>Privacy policy.</h2><p>Note that Your email address will be used to send You notifications considering the most important stages of Order fulfillment such as clarification of any issues, unread messages, and Order completion. Your telephone number will be used only for urgent notifications. As soon as You complete the form, the price for Your Order will be calculated on the basis of deadline, type of work, academic level and the number of pages that you choose. The deadline timer will start counting down only after You perform the payment.</p><h2>Fees and payment</h2><p>The Company\'s charges for the services provided are shown on the Company\'s Website. Please, note that VAT is not included in the prices listed. It is charged to customers from the European Union only. It will be added to the cost of the order in the process of payment transaction. We remind you again that VAT and Discounts are not refundable. If a Customer requires a type of work that cannot be classified as a regular type of services provided on the Company\'s Website or if a Customer requires the finished Product to be amended in a way that is inconsistent with the initial Order instructions, the Company may set own rate for delivery of the Service. A Customer is invited to pay for the Order in advance, given the Company is reasonably confident that it is able to allocate a freelance writer to deliver the Product. If a payment in advance has been provided, but the Company was not able to allocate a freelance writer to deliver the work, a full refund of the payment made in advance will be provided. Other cases of refunds are described in the&nbsp;<a href=\"/money-back-guarantee\">Money Back Guarantee</a> document.</p><h2>Delivery of completed product</h2><p>Upon completion, a Product is available for download by the Customer in his or her personal dashboard page on the Website. If a Customer does not receive a finished Product by the deadline or within 3 (three) hours after the deadline that you have indicated in the initial requirements, the Customer is entitled to receive a certain amount of refund. For further information on this question, view Our&nbsp;<a href=\"/money-back-guarantee\">Money Back Guarantee</a>&nbsp;document. The Company will not be liable for any delays or technical problems in delivery of the Product resulting from any malfunction of the Customer\'s mail-server or the Customer\'s Internet Service Provider.</p><h2>Free revision guarantee</h2><p>Free revisions are possible only in the cases stated in the&nbsp;<a href=\"/revision-policy\">Revision Policy</a>. Please view it for further information on this issue.</p><h2>Privacy &amp; security</h2><p>We do not store Your credit card details, nor do we share the Customer details with any third parties. For a full explanation of the Company\'s practices and policies related to the collection, use and storage of the online guests\' information, please read Our&nbsp;<a href=\"/privacy-policy\">Privacy Policy</a>.</p><h2>Warranties</h2><p>By submitting an Order and/or payment, You acknowledge that You are in complete understanding and agreement with the statements above as well as with each of the following: Any information and/or ideas used from the Product must be properly cited. All Products are provided solely as examples to research, reference, and/or for you to learn how to properly write a paper in a particular citation style (MLA, APA, Chicago, Turabian, Harvard, etc.). All Products were acquired from freelance writers who transferred all the rights and ownership to the Company and/or its affiliates and partners. You are in agreement that this Website is acquiring payment for the time and effort that goes into gathering, organizing, correcting, editing, posting, and delivering these reference materials and the maintenance, administration, and advertising of this Website for educational access. Aside from a reasonable number of copies for personal, non-commercial use, You may not otherwise reproduce, distribute, publish, transmit, modify, display or create derivative works from or exploit the Products and/or contents of this Website without a prior written consent of the Company. You agree to destroy all the delivered Products immediately after Your research/reference use of the material is complete. No copies shall be made for distribution, and no parts of any Product shall be used without proper citation.</p><h2>Limitation of liability</h2><p>You agree to release and hold the Company and its employees, officers, directors, shareholders, agents, representatives, affiliates, subsidiaries, advertising, promotion and fulfillment agencies, any third-party providers or sources of information or data and legal advisers (the \"Company\'s Affiliates\") harmless from any and all losses, damages, rights, claims, and actions of any kind arising from or related to the Products, including but not limited to: (a) telephone, electronic, hardware or software, network, Internet, email, or computer malfunctions, failures or difficulties of any kind; (b) failed, incomplete, garbled or delayed computer transmissions; (c) any condition caused by events beyond the control of the Company that may cause the Product to be delayed, disrupted, or corrupted; (d) any injuries, losses or damages of any kind arising in connection with or as a result of utilizing Our services; or (e) any printing or typographical errors in any materials associated with Our services. In addition, You agree to defend, indemnify, and hold the Company and Company\'s Affiliates harmless from any claim, suit or demand, including attorney\'s fees made by a third party due to or arising out of Your utilizing of Our services, Your violation or breach of these Terms and Conditions, Your violation of any rights of a third party or any other act or omission by You.</p><p>IN NO EVENT SHALL THE COMPANY BE LIABLE FOR ANY DIRECT, INDIRECT, PUNITIVE, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING OUT OF OR IN ANY WAY CONNECTED WITH THE USE OF THIS WEB SITE OR ANY INFORMATION PROVIDED ON THIS WEB SITE. BECAUSE SOME STATES OR JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU.</p><p>You acknowledge and agree that We may unilaterally change these Terms and Conditions. We recommend reviewing these Terms and Conditions from time to time as any such changes will be reflected in this section of Our Website.</p><h2>Premium Writer</h2><p class=\"text-justify\">The Premium Writer option means that your paper will be completed by one of the writers who has worked with us for over 5 years and proved their reliability in over 500 quality papers delivered on time.</p><p class=\"text-justify\">The “Premium writer” feature is non-refundable.&nbsp;</p><h2>Preferred Writers</h2><p class=\"text-justify\">Preferred Writers is an option enabling our customers to assign their orders to specific writers. Such writers can be those who have already delivered some papers to the customer. If the customer selects only one writer, who is not rated as a Premium Writer in our writers’ network, the Preferred Writer option will not be reflected on the order’s cost.&nbsp;</p><p class=\"text-justify\">Alternatively, there are two scenarios, in which additional fees will be collected:</p><ol><li>A writer selected as a preferred one while making an order is the Premium Writer.</li><li>Two or more writers are indicated as preferred ones while making an order, regardless of their rating.&nbsp;</li></ol><p class=\"text-justify\">The “Preferred Writers” feature is non-refundable.&nbsp;</p></div>', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'GB', 'United Kingdom'),
(4, 'AF', 'Afghanistan'),
(5, 'AL', 'Albania'),
(6, 'DZ', 'Algeria'),
(7, 'AS', 'American Samoa'),
(8, 'AD', 'Andorra'),
(9, 'AO', 'Angola'),
(10, 'AI', 'Anguilla'),
(11, 'AQ', 'Antarctica'),
(12, 'AG', 'Antigua and/or Barbuda'),
(13, 'AR', 'Argentina'),
(14, 'AM', 'Armenia'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australia'),
(17, 'AT', 'Austria'),
(18, 'AZ', 'Azerbaijan'),
(19, 'BS', 'Bahamas'),
(20, 'BH', 'Bahrain'),
(21, 'BD', 'Bangladesh'),
(22, 'BB', 'Barbados'),
(23, 'BY', 'Belarus'),
(24, 'BE', 'Belgium'),
(25, 'BZ', 'Belize'),
(26, 'BJ', 'Benin'),
(27, 'BM', 'Bermuda'),
(28, 'BT', 'Bhutan'),
(29, 'BO', 'Bolivia'),
(30, 'BA', 'Bosnia and Herzegovina'),
(31, 'BW', 'Botswana'),
(32, 'BV', 'Bouvet Island'),
(33, 'BR', 'Brazil'),
(34, 'IO', 'British lndian Ocean Territory'),
(35, 'BN', 'Brunei Darussalam'),
(36, 'BG', 'Bulgaria'),
(37, 'BF', 'Burkina Faso'),
(38, 'BI', 'Burundi'),
(39, 'KH', 'Cambodia'),
(40, 'CM', 'Cameroon'),
(41, 'CV', 'Cape Verde'),
(42, 'KY', 'Cayman Islands'),
(43, 'CF', 'Central African Republic'),
(44, 'TD', 'Chad'),
(45, 'CL', 'Chile'),
(46, 'CN', 'China'),
(47, 'CX', 'Christmas Island'),
(48, 'CC', 'Cocos (Keeling) Islands'),
(49, 'CO', 'Colombia'),
(50, 'KM', 'Comoros'),
(51, 'CG', 'Congo'),
(52, 'CK', 'Cook Islands'),
(53, 'CR', 'Costa Rica'),
(54, 'HR', 'Croatia (Hrvatska)'),
(55, 'CU', 'Cuba'),
(56, 'CY', 'Cyprus'),
(57, 'CZ', 'Czech Republic'),
(58, 'CD', 'Democratic Republic of Congo'),
(59, 'DK', 'Denmark'),
(60, 'DJ', 'Djibouti'),
(61, 'DM', 'Dominica'),
(62, 'DO', 'Dominican Republic'),
(63, 'TP', 'East Timor'),
(64, 'EC', 'Ecudaor'),
(65, 'EG', 'Egypt'),
(66, 'SV', 'El Salvador'),
(67, 'GQ', 'Equatorial Guinea'),
(68, 'ER', 'Eritrea'),
(69, 'EE', 'Estonia'),
(70, 'ET', 'Ethiopia'),
(71, 'FK', 'Falkland Islands (Malvinas)'),
(72, 'FO', 'Faroe Islands'),
(73, 'FJ', 'Fiji'),
(74, 'FI', 'Finland'),
(75, 'FR', 'France'),
(76, 'FX', 'France, Metropolitan'),
(77, 'GF', 'French Guiana'),
(78, 'PF', 'French Polynesia'),
(79, 'TF', 'French Southern Territories'),
(80, 'GA', 'Gabon'),
(81, 'GM', 'Gambia'),
(82, 'GE', 'Georgia'),
(83, 'DE', 'Germany'),
(84, 'GH', 'Ghana'),
(85, 'GI', 'Gibraltar'),
(86, 'GR', 'Greece'),
(87, 'GL', 'Greenland'),
(88, 'GD', 'Grenada'),
(89, 'GP', 'Guadeloupe'),
(90, 'GU', 'Guam'),
(91, 'GT', 'Guatemala'),
(92, 'GN', 'Guinea'),
(93, 'GW', 'Guinea-Bissau'),
(94, 'GY', 'Guyana'),
(95, 'HT', 'Haiti'),
(96, 'HM', 'Heard and Mc Donald Islands'),
(97, 'HN', 'Honduras'),
(98, 'HK', 'Hong Kong'),
(99, 'HU', 'Hungary'),
(100, 'IS', 'Iceland'),
(101, 'IN', 'India'),
(102, 'ID', 'Indonesia'),
(103, 'IR', 'Iran (Islamic Republic of)'),
(104, 'IQ', 'Iraq'),
(105, 'IE', 'Ireland'),
(106, 'IL', 'Israel'),
(107, 'IT', 'Italy'),
(108, 'CI', 'Ivory Coast'),
(109, 'JM', 'Jamaica'),
(110, 'JP', 'Japan'),
(111, 'JO', 'Jordan'),
(112, 'KZ', 'Kazakhstan'),
(113, 'KE', 'Kenya'),
(114, 'KI', 'Kiribati'),
(115, 'KP', 'Korea, Democratic People\'s Republic of'),
(116, 'KR', 'Korea, Republic of'),
(117, 'KW', 'Kuwait'),
(118, 'KG', 'Kyrgyzstan'),
(119, 'LA', 'Lao People\'s Democratic Republic'),
(120, 'LV', 'Latvia'),
(121, 'LB', 'Lebanon'),
(122, 'LS', 'Lesotho'),
(123, 'LR', 'Liberia'),
(124, 'LY', 'Libyan Arab Jamahiriya'),
(125, 'LI', 'Liechtenstein'),
(126, 'LT', 'Lithuania'),
(127, 'LU', 'Luxembourg'),
(128, 'MO', 'Macau'),
(129, 'MK', 'Macedonia'),
(130, 'MG', 'Madagascar'),
(131, 'MW', 'Malawi'),
(132, 'MY', 'Malaysia'),
(133, 'MV', 'Maldives'),
(134, 'ML', 'Mali'),
(135, 'MT', 'Malta'),
(136, 'MH', 'Marshall Islands'),
(137, 'MQ', 'Martinique'),
(138, 'MR', 'Mauritania'),
(139, 'MU', 'Mauritius'),
(140, 'TY', 'Mayotte'),
(141, 'MX', 'Mexico'),
(142, 'FM', 'Micronesia, Federated States of'),
(143, 'MD', 'Moldova, Republic of'),
(144, 'MC', 'Monaco'),
(145, 'MN', 'Mongolia'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'SS', 'Republic of South Sudan'),
(178, 'RE', 'Reunion'),
(179, 'RO', 'Romania'),
(180, 'RU', 'Russian Federation'),
(181, 'RW', 'Rwanda'),
(182, 'KN', 'Saint Kitts and Nevis'),
(183, 'LC', 'Saint Lucia'),
(184, 'VC', 'Saint Vincent and the Grenadines'),
(185, 'WS', 'Samoa'),
(186, 'SM', 'San Marino'),
(187, 'ST', 'Sao Tome and Principe'),
(188, 'SA', 'Saudi Arabia'),
(189, 'SN', 'Senegal'),
(190, 'RS', 'Serbia'),
(191, 'SC', 'Seychelles'),
(192, 'SL', 'Sierra Leone'),
(193, 'SG', 'Singapore'),
(194, 'SK', 'Slovakia'),
(195, 'SI', 'Slovenia'),
(196, 'SB', 'Solomon Islands'),
(197, 'SO', 'Somalia'),
(198, 'ZA', 'South Africa'),
(199, 'GS', 'South Georgia South Sandwich Islands'),
(200, 'ES', 'Spain'),
(201, 'LK', 'Sri Lanka'),
(202, 'SH', 'St. Helena'),
(203, 'PM', 'St. Pierre and Miquelon'),
(204, 'SD', 'Sudan'),
(205, 'SR', 'Suriname'),
(206, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(207, 'SZ', 'Swaziland'),
(208, 'SE', 'Sweden'),
(209, 'CH', 'Switzerland'),
(210, 'SY', 'Syrian Arab Republic'),
(211, 'TW', 'Taiwan'),
(212, 'TJ', 'Tajikistan'),
(213, 'TZ', 'Tanzania, United Republic of'),
(214, 'TH', 'Thailand'),
(215, 'TG', 'Togo'),
(216, 'TK', 'Tokelau'),
(217, 'TO', 'Tonga'),
(218, 'TT', 'Trinidad and Tobago'),
(219, 'TN', 'Tunisia'),
(220, 'TR', 'Turkey'),
(221, 'TM', 'Turkmenistan'),
(222, 'TC', 'Turks and Caicos Islands'),
(223, 'TV', 'Tuvalu'),
(224, 'UG', 'Uganda'),
(225, 'UA', 'Ukraine'),
(226, 'AE', 'United Arab Emirates'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_03_29_140408_create_invitation_user_table', 1),
(4, '2017_04_02_040828_create_settings_table', 1),
(5, '2018_01_18_150621_create_additional_services_table', 1),
(6, '2018_01_18_150623_create_order_status_table', 1),
(7, '2018_06_23_110422_create_number_generators_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_11_30_000121_create_tags_table', 1),
(10, '2019_11_30_000132_create_taggables_table', 1),
(11, '2020_01_04_195610_create_permission_tables', 1),
(12, '2020_02_07_100943_create_work_levels_table', 1),
(13, '2020_02_07_100948_create_services_table', 1),
(14, '2020_02_19_044406_create_urgencies_table', 1),
(15, '2020_02_19_044407_create_orders_table', 1),
(16, '2020_02_19_044409_create_order_additional_services_table', 1),
(17, '2020_02_19_044410_create_attachments_table', 1),
(18, '2020_03_31_085504_create_braintrees_table', 1),
(19, '2020_03_31_155202_create_contents_table', 1),
(20, '2020_03_31_155222_create_comments_table', 1),
(21, '2020_04_06_081939_create_submitted_works_table', 1),
(22, '2020_04_18_193032_create_bills_table', 1),
(23, '2020_04_18_194458_create_bill_items_table', 1),
(24, '2020_04_23_090918_create_user_records_table', 1),
(25, '2020_05_04_155214_create_notifications_table', 1),
(26, '2020_05_04_161237_create_activity_log_table', 1),
(27, '2020_05_04_204850_create_ratings_table', 1),
(28, '2020_05_28_070239_create_push_notifications_table', 1),
(29, '2020_05_30_070012_create_followers_table', 1),
(30, '2020_06_10_090024_create_payment_gateways_table', 1),
(31, '2020_06_10_090036_create_offline_payment_methods_table', 1),
(32, '2020_06_10_090046_create_payments_table', 1),
(33, '2020_06_10_200905_create_wallets_table', 1),
(34, '2020_06_10_200937_create_wallet_transactions_table', 1),
(35, '2020_06_14_164221_drop_payment_info_from_orders_table', 1),
(36, '2020_06_24_140555_create_pending_for_approval_payments_table', 1),
(37, '2020_06_26_160230_create_price_types_table', 1),
(38, '2020_06_26_161254_add_price_type_column_in_services_table', 1),
(39, '2020_06_26_170051_modify_price_columns_in_orders_table', 1),
(40, '2020_06_27_043031_create_service_tag_additional_services_table', 1),
(41, '2020_06_28_120413_create_jobs_table', 1),
(42, '2020_07_03_004916_drop_braintrees_table', 1),
(43, '2020_07_05_152727_create_countries_table', 1),
(44, '2020_07_05_152728_create_applicant_statuses_table', 1),
(45, '2020_07_05_152729_create_referral_sources_table', 1),
(46, '2020_07_05_153543_create_applicants_table', 1),
(47, '2020_09_23_190349_add_archive_column_to_users_table', 1),
(48, '2020_09_26_064515_add_timezone_column_to_users_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `number_generators`
--

CREATE TABLE `number_generators` (
  `id` int(10) UNSIGNED NOT NULL,
  `generatable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_generated_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `success_message` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `work_level_id` int(10) UNSIGNED NOT NULL,
  `urgency_id` int(10) UNSIGNED NOT NULL,
  `dead_line` datetime DEFAULT NULL,
  `unit_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `work_level_price` decimal(10,2) NOT NULL,
  `urgency_price` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `staff_payment_amount` decimal(10,2) DEFAULT NULL,
  `spacing_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_level_percentage` double DEFAULT NULL,
  `urgency_percentage` double DEFAULT NULL,
  `staff_id` int(10) UNSIGNED DEFAULT NULL,
  `order_status_id` int(10) UNSIGNED NOT NULL,
  `update_via_sms` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `invoiced` datetime DEFAULT NULL,
  `billed` tinyint(1) DEFAULT NULL,
  `archived` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_additional_services`
--

CREATE TABLE `order_additional_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

CREATE TABLE `order_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `badge` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `badge`) VALUES
(1, 'New', 'badge-primary'),
(2, 'In progress', 'badge-info'),
(3, 'Submitted for approval', 'badge-info'),
(4, 'Requested for revision', 'badge-warning'),
(5, 'Completed', 'badge-success'),
(6, 'On hold', 'badge-secondary'),
(7, 'Canceled', 'badge-dark'),
(8, 'Refunded', 'badge-danger'),
(9, 'Pending Payment', 'badge-dark'),
(10, 'Payment needs approval', 'badge-danger'),
(11, 'Payment Disapproved', 'badge-dark');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `unique_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pending_for_approval_payments`
--

CREATE TABLE `pending_for_approval_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_types`
--

CREATE TABLE `price_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_types`
--

INSERT INTO `price_types` (`id`, `name`) VALUES
(1, 'Fixed'),
(2, 'Per Word'),
(3, 'Per Page');

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `number` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral_sources`
--

CREATE TABLE `referral_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_order` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `referral_sources`
--

INSERT INTO `referral_sources` (`id`, `name`, `display_order`) VALUES
(1, 'Indeed', 1),
(2, 'LinkedIn', 2),
(3, 'Facebook', 3),
(4, 'Craiglist', 4),
(5, 'Friend', 5),
(6, 'Others', 6);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-04-08 19:17:40', '2021-04-08 19:17:40'),
(2, 'staff', 'web', '2021-04-08 19:17:40', '2021-04-08 19:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_type_id` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `price` decimal(10,2) DEFAULT NULL,
  `single_spacing_price` decimal(10,2) DEFAULT NULL,
  `double_spacing_price` decimal(10,2) DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `minimum_order_quantity` int(10) UNSIGNED DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_tag_additional_services`
--

CREATE TABLE `service_tag_additional_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `additional_service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `option_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_load_disabled` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option_key`, `option_value`, `auto_load_disabled`) VALUES
(1, 'company_name', 'ProWriters', NULL),
(2, 'company_logo', 'public/uploads/logo.png', NULL),
(3, 'company_phone', '541 754-3010', NULL),
(4, 'company_address', '4287 Smith Via\nTellytown, NV 12467-0389', NULL),
(5, 'company_country', 'USA', NULL),
(6, 'company_email', 'support@prowriters.com', NULL),
(7, 'company_notification_email', 'support@prowriters.com', NULL),
(8, 'company_about', 'Firmament morning sixth subdue darkness creeping gathered divide our let god moving. Moving in fourth air night bring upon it beast let you dominion likeness open place day great.', NULL),
(9, 'enable_paypal', '1', NULL),
(10, 'enable_creditcard', '1', NULL),
(11, 'facebook', 'http://www.facebook.com/microelephant', NULL),
(12, 'twitter', 'http://www.twitter.com', NULL),
(13, 'instagram', 'http://www.instagram.com', NULL),
(14, 'linkedin', 'http://www.linkedin.com', NULL),
(15, 'footer_text', 'All rights reserved | Microelephant', NULL),
(16, 'system_starting_year', '2021', NULL),
(17, 'time_zone', 'America/New_York', NULL),
(18, 'decimal_symbol', '.', NULL),
(19, 'thousand_separator', ',', NULL),
(20, 'digit_grouping_method', '1', NULL),
(21, 'currency_symbol', '$', NULL),
(22, 'currency_code', 'USD', NULL),
(23, 'enable_browsing_work', 'yes', NULL),
(24, 'staff_payment_amount', '1.5', NULL),
(25, 'staff_payment_type', 'percentage', NULL),
(26, 'number_of_revision_allowed', '-1', NULL),
(27, 'prowriters_version', '1.7', NULL),
(28, 'hero_title_1', 'Top Grade Writing Service', 1),
(29, 'hero_button_text', 'Get an instant Quote', 1),
(30, 'section_1_title', 'High-Quality Papers from Expert Writers', 1),
(31, 'section_1_content', 'Our team creates college research papers and essays. We take into account every single requirement mentioned by the customer: deadline, subject, topic, level, number of pages, etc. You describe your assignment - we do the whole job! Our experts can complete any academic task within the given period of time. We ensure high-quality essay writing and editing services. And yet, the prices are reasonable for every student. If you wish to save your day, choose an essay writer from our team or let our experts select the author for you based on your requirements. It’s easy to order from our website.', 1),
(32, 'section_2_title', 'Types of Works We Offer', 1),
(33, 'section_2_sub_title', 'Get professional assistance from our experts. Our writers only write English language essays and papers.', 1),
(34, 'section_3_title', 'How it works', 1),
(35, 'section_3_sub_title', 'Our writers deliver most of the essays ahead of schedule. It takes 4 simple steps to buy your custom paper:', 1),
(36, 'how_it_works_step_1', 'Fill out the order form:', 1),
(37, 'how_it_works_step_2', 'Proceed with payment:', 1),
(38, 'how_it_works_step_3', 'Communicate:', 1),
(39, 'how_it_works_step_4', 'Get your finished order:', 1),
(40, 'how_it_works_step_1_content', 'Submit your order details with the potential writer (subject, type of work, level, format, size, and deadline).', 1),
(41, 'how_it_works_step_2_content', 'Pay for our essay writer service. Pick one of the available safe methods online: PayPal, or debit/credit card.', 1),
(42, 'how_it_works_step_3_content', 'Contact the assigned expert at any time you need to solve different problems and watch the process.', 1),
(43, 'how_it_works_step_4_content', 'Receive your essay before the deadline. Check the quality. Revisions are possible during 2 weeks after the order delivery.', 1),
(44, 'section_4_title', 'Features that make us special', 1),
(45, 'section_4_para_1_title', '100% Confidentiality', 1),
(46, 'section_4_para_1_content', 'Information about customers is confidential and never disclosed to third parties. Information about customers is confidential and never disclosed to third parties.', 1),
(47, 'section_4_para_2_title', 'Timely Delivery', 1),
(48, 'section_4_para_2_content', 'No missed deadlines – 97% of assignments are complete in time.', 1),
(49, 'section_4_para_3_title', 'Original Writing', 1),
(50, 'section_4_para_3_content', 'We complete all papers from scratch. You can get a plagiarism report.', 1),
(51, 'section_4_para_4_title', 'Plagiarism-Free Content', 1),
(52, 'section_4_para_4_content', 'We follow a strict anti-plagiarism policy thus all the papers are written from scratch. We scan every paper for plagiarism with a special licensed software to ensure 100% originality and proper citation before sending it to our clients.', 1),
(53, 'order_page_link_text', 'Calculate your order', 1),
(54, 'seo_title_home', 'Home', 1),
(55, 'seo_description_home', 'Dolorem magni atque quis aut. Soluta omnis debitis suscipit non fugit iure quia qui.', 1),
(56, 'seo_keywords_home', 'odit,suscipit,possimus,eum,aperiam', 1),
(57, 'seo_title_pricing', 'Pricing', 1),
(58, 'seo_description_pricing', 'Adipisci amet molestiae aut. Architecto pariatur modi quibusdam ab ratione vel.', 1),
(59, 'seo_keywords_pricing', 'fugit,aperiam,quia,quia,excepturi', 1),
(60, 'seo_title_how_it_works', 'How It Works', 1),
(61, 'seo_description_how_it_works', 'Qui consequatur atque distinctio. Illum laborum et pariatur consequatur eius totam eveniet.', 1),
(62, 'seo_keywords_how_it_works', 'rerum,qui,praesentium,iure,eligendi', 1),
(63, 'seo_title_faq', 'Faq', 1),
(64, 'seo_description_faq', 'Aperiam aperiam ullam impedit dolores. Itaque tempore et libero amet dolorem. Id sint aut in alias.', 1),
(65, 'seo_keywords_faq', 'quas,ea,nulla,laborum,quis', 1),
(66, 'seo_title_contact', 'Contact', 1),
(67, 'seo_description_contact', 'Adipisci est iusto et eos. Est aut est nesciunt. Est nemo et officia corporis excepturi aperiam.', 1),
(68, 'seo_keywords_contact', 'eligendi,qui,in,non,mollitia', 1),
(69, 'seo_title_instant_quote', 'Instant Quote', 1),
(70, 'seo_description_instant_quote', 'Consequatur nam aut nulla nemo. Exercitationem totam at dolore illo consequatur recusandae odio.', 1),
(71, 'seo_keywords_instant_quote', 'tempora,quidem,sunt,perspiciatis,et', 1),
(72, 'seo_title_money_back_guarantee', 'Money Back Guarantee', 1),
(73, 'seo_description_money_back_guarantee', 'Rem a quas eaque commodi ad. Ratione in voluptas eaque ipsum.', 1),
(74, 'seo_keywords_money_back_guarantee', 'ut,sint,quia,hic,animi', 1),
(75, 'seo_title_privacy_policy', 'Privacy Policy', 1),
(76, 'seo_description_privacy_policy', 'Non qui et ab itaque. Quod perspiciatis est aut pariatur. Nulla quia et et et voluptatem dolores.', 1),
(77, 'seo_keywords_privacy_policy', 'ex,labore,sapiente,ex,harum', 1),
(78, 'seo_title_revision_policy', 'Revision Policy', 1),
(79, 'seo_description_revision_policy', 'Suscipit dolorem aut odio ut. Sit illum numquam est. Iste voluptatibus occaecati ut non.', 1),
(80, 'seo_keywords_revision_policy', 'magnam,qui,quisquam,placeat,rerum', 1),
(81, 'seo_title_disclaimer', 'Disclaimer', 1),
(82, 'seo_description_disclaimer', 'Eius id quia dolores asperiores dicta. Praesentium harum illo iusto quis architecto.', 1),
(83, 'seo_keywords_disclaimer', 'quibusdam,et,dolores,velit,id', 1),
(84, 'seo_title_terms_and_conditions', 'Terms And Conditions', 1),
(85, 'seo_description_terms_and_conditions', 'Et aut praesentium voluptatum. Similique et quia sed. Velit ex aut quo ea accusantium eaque.', 1),
(86, 'seo_keywords_terms_and_conditions', 'eius,velit,sequi,doloribus,necessitatibus', 1),
(87, 'disable_writer_application', '', NULL),
(88, 'show_writer_application_link_website_top_menu', '1', NULL),
(89, 'writer_application_page_link_title', 'Become a writer', NULL),
(90, 'writer_application_page_title', 'Become a writer - Join us', NULL),
(91, 'writer_application_form_title', 'Join our team', NULL),
(92, 'writer_application_form_subtitle', 'Please thoroughly review our list of qualifications before applying.', NULL),
(93, 'writer_application_page_content', '<h2><strong>About </strong></h2><p><span style=\"color: rgb(58, 58, 58); background-color: rgb(255, 255, 255);\">We ensure our customers receive work of the highest quality by supporting our essay writers throughout every stage of the process, from assignment to delivery. We choose to work exclusively with individuals committed to clarity and transparency, who are passionate about helping others learn, grow and better understand the world around them.</span></p><p><br></p><h2><strong>Qualified candidates must have:</strong></h2><ul><li>a flawless grasp of MLA, APA and CPS formatting.</li><li>a bachelor\'s degree, or be in active pursuit of one.</li><li>a 3.3 GPA or better.</li><li>a clear understanding of how to conduct online research.</li><li>the ability to cheerfully accept constructive criticism.</li><li>a consistent commitment to being responsive and reliable.</li><li>Microsoft Office.</li></ul><h2><br></h2><h2><strong>Perks of the job:</strong></h2><ul><li>Choose your own assignments and work when you want, where you want.</li><li>Enjoy working as part of an elite team of skilled and supportive colleagues.</li><li>Write what you know and learn what you don’t on topics ranging from marketing and economics to philosophy and politics.</li><li>We offer among the highest rates in the industry, averaging $25 an hour.</li><li>Payment is delivered conveniently through direct deposit or PayPal.</li></ul><p><br></p><p><br></p>', NULL),
(94, 'writer_application_form_success_message', 'Thank you for submitting your application', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `submitted_works`
--

CREATE TABLE `submitted_works` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `needs_revision` tinyint(1) DEFAULT NULL,
  `customer_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` int(10) UNSIGNED NOT NULL,
  `taggable_id` int(10) UNSIGNED NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `urgencies`
--

CREATE TABLE `urgencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('days','hours') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int(11) NOT NULL,
  `percentage_to_add` double(8,2) NOT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `photo`, `timezone`, `inactive`, `last_login_at`, `last_login_ip`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'Lastname', 'admin@demo.com', '2021-04-08 19:17:40', '$2y$10$OB5mGioikITKdK20ELDc6OU0mNaQEvS8PgD3QfGtq1kAndySjlMzy', NULL, NULL, NULL, NULL, '2021-04-08 15:18:19', '127.0.0.1', '2021-04-08 19:17:40', '2021-04-08 19:18:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_invitations`
--

CREATE TABLE `user_invitations` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','successful','canceled','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `valid_till` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_records`
--

CREATE TABLE `user_records` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `option_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_value` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_id` int(10) UNSIGNED NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transactionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transactionable_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_levels`
--

CREATE TABLE `work_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage_to_add` double(8,2) NOT NULL,
  `inactive` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Indexes for table `additional_services`
--
ALTER TABLE `additional_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applicants`
--
ALTER TABLE `applicants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applicants_email_unique` (`email`),
  ADD KEY `applicants_applicant_status_id_foreign` (`applicant_status_id`);

--
-- Indexes for table `applicant_statuses`
--
ALTER TABLE `applicant_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attachments_user_id_foreign` (`user_id`),
  ADD KEY `attachments_order_id_index` (`order_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_user_id_foreign` (`user_id`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_bill_id_foreign` (`bill_id`),
  ADD KEY `bill_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_order_id_index` (`order_id`),
  ADD KEY `comments_user_id_index` (`user_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contents_slug_unique` (`slug`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `followers_order_id_user_id_unique` (`order_id`,`user_id`),
  ADD KEY `followers_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `number_generators`
--
ALTER TABLE `number_generators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_service_id_foreign` (`service_id`),
  ADD KEY `orders_work_level_id_foreign` (`work_level_id`),
  ADD KEY `orders_urgency_id_foreign` (`urgency_id`),
  ADD KEY `orders_order_status_id_index` (`order_status_id`),
  ADD KEY `orders_customer_id_index` (`customer_id`),
  ADD KEY `orders_staff_id_index` (`staff_id`);

--
-- Indexes for table `order_additional_services`
--
ALTER TABLE `order_additional_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_additional_services_order_id_foreign` (`order_id`),
  ADD KEY `order_additional_services_service_id_foreign` (`service_id`);

--
-- Indexes for table `order_statuses`
--
ALTER TABLE `order_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_user_id_index` (`user_id`),
  ADD KEY `payments_method_index` (`method`),
  ADD KEY `payments_reference_index` (`reference`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_gateways_unique_name_unique` (`unique_name`);

--
-- Indexes for table `pending_for_approval_payments`
--
ALTER TABLE `pending_for_approval_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pending_for_approval_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price_types`
--
ALTER TABLE `price_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `push_notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_order_id_foreign` (`order_id`),
  ADD KEY `ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `referral_sources`
--
ALTER TABLE `referral_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_price_type_id_foreign` (`price_type_id`);

--
-- Indexes for table `service_tag_additional_services`
--
ALTER TABLE `service_tag_additional_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_tag_additional_services_service_id_index` (`service_id`),
  ADD KEY `service_tag_additional_services_additional_service_id_index` (`additional_service_id`),
  ADD KEY `service_additional_service` (`service_id`,`additional_service_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `submitted_works`
--
ALTER TABLE `submitted_works`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submitted_works_order_id_index` (`order_id`),
  ADD KEY `submitted_works_user_id_index` (`user_id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  ADD KEY `taggables_tag_id_index` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `urgencies`
--
ALTER TABLE `urgencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_invitations`
--
ALTER TABLE `user_invitations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_invitations_code_index` (`code`);

--
-- Indexes for table `user_records`
--
ALTER TABLE `user_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_records_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_user_id_index` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactionable` (`transactionable_type`,`transactionable_id`),
  ADD KEY `wallet_transactionable` (`wallet_id`,`transactionable_type`,`transactionable_id`);

--
-- Indexes for table `work_levels`
--
ALTER TABLE `work_levels`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `additional_services`
--
ALTER TABLE `additional_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicants`
--
ALTER TABLE `applicants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applicant_statuses`
--
ALTER TABLE `applicant_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `number_generators`
--
ALTER TABLE `number_generators`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_additional_services`
--
ALTER TABLE `order_additional_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_statuses`
--
ALTER TABLE `order_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pending_for_approval_payments`
--
ALTER TABLE `pending_for_approval_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_types`
--
ALTER TABLE `price_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `referral_sources`
--
ALTER TABLE `referral_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_tag_additional_services`
--
ALTER TABLE `service_tag_additional_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `submitted_works`
--
ALTER TABLE `submitted_works`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `urgencies`
--
ALTER TABLE `urgencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_invitations`
--
ALTER TABLE `user_invitations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_records`
--
ALTER TABLE `user_records`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_levels`
--
ALTER TABLE `work_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicants`
--
ALTER TABLE `applicants`
  ADD CONSTRAINT `applicants_applicant_status_id_foreign` FOREIGN KEY (`applicant_status_id`) REFERENCES `applicant_statuses` (`id`);

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `attachments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `attachments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD CONSTRAINT `bill_items_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `bill_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`),
  ADD CONSTRAINT `orders_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `orders_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_urgency_id_foreign` FOREIGN KEY (`urgency_id`) REFERENCES `urgencies` (`id`),
  ADD CONSTRAINT `orders_work_level_id_foreign` FOREIGN KEY (`work_level_id`) REFERENCES `work_levels` (`id`);

--
-- Constraints for table `order_additional_services`
--
ALTER TABLE `order_additional_services`
  ADD CONSTRAINT `order_additional_services_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_additional_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pending_for_approval_payments`
--
ALTER TABLE `pending_for_approval_payments`
  ADD CONSTRAINT `pending_for_approval_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD CONSTRAINT `push_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_price_type_id_foreign` FOREIGN KEY (`price_type_id`) REFERENCES `price_types` (`id`);

--
-- Constraints for table `service_tag_additional_services`
--
ALTER TABLE `service_tag_additional_services`
  ADD CONSTRAINT `service_tag_additional_services_additional_service_id_foreign` FOREIGN KEY (`additional_service_id`) REFERENCES `additional_services` (`id`),
  ADD CONSTRAINT `service_tag_additional_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

--
-- Constraints for table `submitted_works`
--
ALTER TABLE `submitted_works`
  ADD CONSTRAINT `submitted_works_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `submitted_works_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_records`
--
ALTER TABLE `user_records`
  ADD CONSTRAINT `user_records_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallets`
--
ALTER TABLE `wallets`
  ADD CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
