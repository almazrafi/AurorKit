//
//  LoggedViewController.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

public class LoggedViewController: UIViewController {

    // MARK: - Initializers

    deinit {
        Log.high("deinit", from: self)
    }

    // MARK: - Instance Methods

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        Log.high("didReceiveMemoryWarning()", from: self)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()

        Log.high("viewDidLoad()", from: self)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Log.high("viewWillAppear(animated: \(animated))", from: self)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Log.high("viewDidAppear(animated: \(animated))", from: self)
    }

    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        Log.high("viewWillDisappear(animated: \(animated))", from: self)
    }

    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        Log.high("viewDidDisappear(animated: \(animated))", from: self)
    }
}
