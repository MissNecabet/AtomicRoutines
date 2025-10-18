//
//  CalendarView.swift
//  AtomicRoutines
//
//  Created by Najabat Sofiyeva on 15.10.25.
//
import UIKit
import FSCalendar

class CalendarView: UIView {

    private let calendar = FSCalendar()
    //sechilen  aya ve ile aid date fscalendarin title da  gorunur
    private var currentDate = Date()
    private let RegisterDateKey = "AppInstallDate"
    private var RegisterDate: Date = Date()
    
    private let prevMonthButton = UIButton()
    private let nextMonthButton = UIButton()
    private var monthLabel = UILabel()
    private let monthManageStack = UIStackView()
    private let monthStack = UIStackView()
    
    private let prevYearButton = UIButton()
    private let nextYearButton = UIButton()
    private var yearLabel = UILabel()
    private var yearManageStack = UIStackView()
    private let yearStack = UIStackView()
    
    private let dateStack = UIStackView()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
            backgroundColor = .white
            let formatter = DateFormatter()
            formatter.dateFormat = "LLLL"
            yearLabel.text = "\(Calendar.current.component(.year, from: currentDate))"
            monthLabel.text = formatter.string(from: currentDate)
            setupRegisterDate()
            setupCalendar()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
   
    
     //  register olan kimi calendarView achilanda user ucun baslanqic tarixi goturulur yoxdusa yaradilir
    private func setupRegisterDate() {
        if let savedDate = UserDefaults.standard.object(forKey: RegisterDateKey) as? Date {
            RegisterDate = savedDate
        } else {
            RegisterDate = Date()
            UserDefaults.standard.set(RegisterDate, forKey: RegisterDateKey)
        }
    }
    // MONTH AND YEAR MANAGEMENT
    
    @objc func prevMonth(){ changeDate(by: -1)}
    @objc func nextMonth(){ changeDate(by: 1)}
    @objc func prevYear() { changeDate(by: -12)}
    @objc func nextYear() { changeDate(by: 12)}
    
    //   CHANGE MONTH AND YEAR
    private func changeDate(by value :Int){
        if let newDate = Calendar.current.date(byAdding: .month, value: value, to: currentDate) {
            currentDate = newDate
            
            // Ay və il label-lari guncəlləyirik
            let formatter = DateFormatter()
            formatter.dateFormat = "LLLL"
            monthLabel.text = formatter.string(from: currentDate)
            print(monthLabel)
            
            formatter.dateFormat = "yyyy"
            yearLabel.text = formatter.string(from: currentDate)
            print(yearLabel)
            calendar.setCurrentPage(newDate, animated: true)
            
        }
    }
    
    private func setupCalendar() {
        calendar.delegate = self
        calendar.dataSource = self
        addSubview(calendar)
        calendar.translatesAutoresizingMaskIntoConstraints = false
        
 // CONFIGURE  MANAGE MONTH
        prevMonthButton.setTitle("<", for: .normal)
        prevMonthButton.addTarget(self, action: #selector(prevMonth), for: .touchUpInside)
        prevMonthButton.setTitleColor(.black, for: .normal)
        
        nextMonthButton.setTitle(">", for: .normal)
        nextMonthButton.addTarget(self, action: #selector(nextMonth), for: .touchUpInside)
        nextMonthButton.setTitleColor(.black, for: .normal)
        
        monthLabel.textAlignment = .center
        monthLabel.font = UIFont.boldSystemFont(ofSize: 16)
        monthLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        monthManageStack.axis = .horizontal
        monthManageStack.spacing = 5
        monthManageStack.alignment = .center
        monthManageStack.distribution = .fillEqually
        monthManageStack.addArrangedSubview(prevMonthButton)
        monthManageStack.addArrangedSubview(nextMonthButton)
        monthManageStack.translatesAutoresizingMaskIntoConstraints = false
        
        monthStack.axis = .horizontal
        monthStack.distribution = .fill
        monthStack.addArrangedSubview(monthLabel)
        monthStack.addArrangedSubview(monthManageStack)
        monthStack.translatesAutoresizingMaskIntoConstraints = false
        dateStack.addSubview(monthStack)
       
       
        
//  CONFIGURE MANAGE YEAR
        
        prevYearButton.setTitle("<", for: .normal)
        prevYearButton.addTarget(self, action: #selector(prevYear), for: .touchUpInside)
        prevYearButton.setTitleColor(.black, for: .normal)
        
        nextYearButton.setTitle(">", for: .normal)
        nextYearButton.addTarget(self, action: #selector(nextYear), for: .touchUpInside)
        nextYearButton.setTitleColor(.black, for: .normal)
        
        yearLabel.textAlignment = .center
        yearLabel.font = UIFont.boldSystemFont(ofSize: 16)
        yearLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true

        yearManageStack.axis = .horizontal
        yearManageStack.spacing = 5
        yearManageStack.alignment = .center
        yearManageStack.distribution = .fillEqually
        yearManageStack.addArrangedSubview(prevYearButton)
        yearManageStack.addArrangedSubview(nextYearButton)
        yearManageStack.translatesAutoresizingMaskIntoConstraints = false
       
        
        yearStack.axis = .horizontal
        yearStack.distribution = .fill
        yearStack.addArrangedSubview(yearLabel)
        yearStack.addArrangedSubview(yearManageStack)
        yearStack.translatesAutoresizingMaskIntoConstraints = false
        dateStack.addSubview(yearStack)
        
    // CONFIGURE DATESTACK
        dateStack.axis = .horizontal
        dateStack.distribution = .fill
        dateStack.addArrangedSubview(monthStack)
        dateStack.addArrangedSubview(yearStack)
        dateStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateStack)
        
        NSLayoutConstraint.activate([
           
            dateStack.topAnchor.constraint(equalTo: topAnchor),
            dateStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateStack.heightAnchor.constraint(equalToConstant: 50),
            
            calendar.topAnchor.constraint(equalTo: dateStack.bottomAnchor),
            calendar.centerXAnchor.constraint(equalTo: centerXAnchor),
            calendar.widthAnchor.constraint(equalToConstant: 300),
            calendar.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        // UI tənzimləmələri
        calendar.headerHeight = 0
        calendar.appearance.borderRadius = 0.0
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.todayColor = .purple
        calendar.appearance.selectionColor = .blue
        calendar.appearance.titleFont = UIFont(name: "Poppins-SemiBold", size: 12)
        calendar.appearance.weekdayFont = UIFont(name: "Poppins-SemiBold", size: 12)
    }
    
  
}



extension CalendarView:FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance{
    // MARK: FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        // sadece registerdate den sonraki gunler sechile biler.
        return date >= RegisterDate
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        print("Selected date: \(formatter.string(from: date))")
    }

    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let today = Calendar.current.startOfDay(for: Date())
        let startDay = Calendar.current.startOfDay(for: RegisterDate)
        
        if date < startDay {
            return UIColor(named: "telegramCellColor")
        } else if Calendar.current.isDate(date, inSameDayAs: today) {
            return .purple
        } else if date < today {
            return .systemGreen
        }
        return .white
    }
}
