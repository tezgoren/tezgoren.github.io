.notepad {
    width: 100 %;
    max - width: 500px;
    margin: 20px auto;
    background - color: #f5f5f5;
    padding: 10px;
    border - radius: 10px;
    box - shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

ul#taskList {
    list - style - type: none;
    padding: 0;
}

ul#taskList li {
    display: flex;
    align - items: center;
    padding: 8px 0;
}

.task - checkbox {
    margin - right: 10px;
}

.task - input {
    flex: 1;
    padding: 8px;
    border: 1px solid #ddd;
    border - radius: 5px;
    font - size: 16px;
    transition: background - color 0.3s ease;
}

.task - input:focus {
    border - color: #4CAF50;
    background - color: #e8f5e9;
}

.task - input::placeholder {
    color: #aaa;
}

.task - checkbox: checked + .task - input {
    text - decoration: line - through;
    color: #d3d3d3;
    opacity: 0.5;
}

li: last - child.task - input {
    border - bottom: none;
}

li: last - child {
    padding - bottom: 0;
}

.task - input:focus {
    outline: none;
}
