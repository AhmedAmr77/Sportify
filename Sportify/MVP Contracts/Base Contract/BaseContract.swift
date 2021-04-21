//
//  BaseContract.swift
//  Sportify
//
//  Created by Ahmd Amr on 21/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation


protocol BaseViewProtocol {
    
    func showLoading()
    func hideLoading()
    func showErrorMessage(errorMessage: String)

}
