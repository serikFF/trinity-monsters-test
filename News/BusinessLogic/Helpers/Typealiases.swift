//
//  Typealiases.swift
//  News
//
//  Created by Sergei Rosliakov on 25.08.2020.
//

import Foundation

typealias ArticlesClosure = ([Article]) -> Void
typealias ResponseClosure = (Data) -> Void
typealias ErrorClosure = (AppError) -> Void
typealias VoidClosure = () -> Void
