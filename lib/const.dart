const baseImageURL = 'assets/template-images/base-image.jpg';
const masterCardImage = 'assets/template-images/master-card-logo.jpg';
const visaImage = 'assets/template-images/visa-logo.png';
const amexImage = 'assets/template-images/american-express-logo.png';

String getPaymentMethodImage(String paymentDetails) {
  if (paymentDetails.startsWith('2') || paymentDetails.startsWith('5')) return masterCardImage;

  if (paymentDetails.startsWith('4')) return visaImage;

  if (paymentDetails.startsWith('3')) return amexImage;

  return '';
}