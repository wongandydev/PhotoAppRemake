/*
* Copyright (c) 2016 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ZoomedPhotoViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    
  var photoName: String!
  
  override func viewDidLoad() {
    imageView.image = UIImage(named: photoName)
  }
  private func updateMinZoomScaleForSize(size: CGSize) { //Can use this with code OR use storyboard, click on 'Scroll View' and change zoom min and max; does the same thing 
    let widthScale = size.width / imageView.bounds.width //Divides the width of CGSize with the imageView's bound width to get a scale which is the amount maximum the photo can get to in width .
    let heightScale = size.height / imageView.bounds.height //Same thing as that widthScale does but for heights
    let minScale = min(widthScale, heightScale) // min returns the smaller of the two, if they are equal ,it will return the x(widthScale)
    
    scrollView.minimumZoomScale = minScale //sets the scrollview's minimumZoonScale to minScale
    
    scrollView.zoomScale = minScale //sets scrollview's zoom scale to minScale
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    updateMinZoomScaleForSize(view.bounds.size) //calls updateMinZoomScaleForSize to UIView's bound size as the size parameter in private function updateMinZoonScaleForSize
  }

}




  extension ZoomedPhotoViewController :UIScrollViewDelegate { //Tells the imageView to be zoomed when the uuser is pinching ot make it bigger or smaller //Calls class 'ZoomedPhotoViewController' as a UiScrollView Delagate
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }
}


