const display = document.getElementById("display");
const keys = document.getElementById("keys");

let tokens = [];

function render() {
  if (tokens.length === 0) {
    display.textContent = "0";
    return;
  }
  display.textContent = tokens
    .map((token) => (token === "*" ? "×" : token === "/" ? "÷" : token === "-" ? "−" : token))
    .join(" ");
}

function clearAll() {
  tokens = [];
  render();
}

function appendDigit(digit) {
  const last = tokens[tokens.length - 1];
  if (last !== undefined && !isOperator(last) && last !== "Error") {
    if (digit === "." && last.includes(".")) return;
    tokens[tokens.length - 1] = last + digit;
  } else if (digit === ".") {
    tokens.push("0.");
  } else {
    tokens.push(digit);
  }
  render();
}

function isOperator(token) {
  return token === "+" || token === "-" || token === "*" || token === "/";
}

function appendOperator(op) {
  if (tokens.length === 0 || isOperator(tokens[tokens.length - 1])) return;
  tokens.push(op);
  render();
}

function evaluate() {
  if (tokens.length === 0) return;

  const normalized = [...tokens];
  if (isOperator(normalized[normalized.length - 1])) {
    normalized.pop();
  }

  let result = parseFloat(normalized[0]);
  if (Number.isNaN(result)) {
    tokens = ["Error"];
    render();
    return;
  }

  for (let i = 1; i < normalized.length; i += 2) {
    const op = normalized[i];
    const rhs = parseFloat(normalized[i + 1]);
    if (Number.isNaN(rhs)) break;

    if (op === "/" && rhs === 0) {
      tokens = ["Error"];
      render();
      return;
    }

    switch (op) {
      case "+":
        result += rhs;
        break;
      case "-":
        result -= rhs;
        break;
      case "*":
        result *= rhs;
        break;
      case "/":
        result /= rhs;
        break;
      default:
        break;
    }
  }

  tokens = [String(result)];
  render();
}

keys.addEventListener("click", (event) => {
  const button = event.target.closest("button");
  if (!button) return;

  if (tokens[0] === "Error") clearAll();

  if (button.dataset.action === "clear") {
    clearAll();
    return;
  }

  if (button.dataset.action === "equals") {
    evaluate();
    return;
  }

  if (button.dataset.op) {
    appendOperator(button.dataset.op);
    return;
  }

  if (button.dataset.value !== undefined) {
    appendDigit(button.dataset.value);
  }
});

render();
