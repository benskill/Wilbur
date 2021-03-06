//
//  Protocols.swift
//  Wilbur
//
//  Created by Ben Sullivan on 19/07/2016.
//  Copyright © 2016 Sullivan Applications. All rights reserved.
//

protocol NavigationBarDelegate: class {
  func didSelectSegment(segment: Int)
}

protocol UpdateNavButtonsDelegate: class {
  func updateNavButtons()
}

protocol PostButtonPressedDelegate: class {
  func postButtonPressed()
}

protocol ReloadTableDelegate: class {
  func reloadTable()
}

protocol PostCellDelegate: class {
  func showAlert(post: Post)
  func customCellCommentButtonPressed()
}

protocol MyPostsCellDelegate: class {
  func showComments(post: Post, image: UIImage)
  func showDeleteAlert(post: Post)
}

protocol CreatePostDelegate {
  func displayAlert(title: String, message: String, state: AlertState)
  func postSuccessful()
  func postError()
}
