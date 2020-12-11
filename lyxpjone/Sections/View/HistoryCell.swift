//
//  HistoryCell.swift
//  lyxpjone
//
//  Created by lyx on 2020/12/12.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var webInfo : WebInfo? {
        
        didSet {
            guard let info = webInfo else {
                return
            }
            timeLabel.text = info.time
            showLabel.text = "\(info)"
        }
    }
    
    lazy var timeLabel : UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.text = "time"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var showLabel : UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .red
        label.text = "content"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var baseBottomSplitView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .groupTableViewBackground
        return view
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initSubviews()
        configCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews()  {
        
        contentView.addSubview(timeLabel)
        contentView.addSubview(showLabel)
        contentView.addSubview(baseBottomSplitView)
        
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview()
        }
        
        showLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
        }
        
        baseBottomSplitView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(showLabel.snp.bottom).offset(10)
            make.height.equalTo(1)
        }
        
        viewInitFinished()
        
    }
    
    func viewInitFinished()  {
        
    }
    
    func configCell()  {
        
        selectionStyle = .none
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
