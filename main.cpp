#include <rw/i18n/RWUFromUnicodeConverter.h>
#include <rw/i18n/RWUInit.h>
#include <rw/i18n/RWUString.h>
#include <rw/i18n/RWURegexMatchIterator.h>
#include <rw/i18n/RWURegularExpression.h>
#include <rw/cstring.h>
#include <iostream>

int main()
{
    RWUInit init;
    RWCString pattern("[{C}_]+");
    RWURegularExpression exp(pattern, RWURegularExpression::Basic, RWURegularExpression::IgnoreCase);

    RWUString text("\\ud835\\udcf1\\ud835\\udcee\\ud835\\udcf5\\ud835\\udcf5\\ud835\\udcf8, \\ud835\\udd00\\ud835\\udcf8\\ud835\\udcfb\\ud835\\udcf5\\ud835\\udced");
    text.unescape();

    RWURegexMatchIterator endIter;
    for (RWURegexMatchIterator iter(exp, text); iter != endIter; ++iter) {
        std::cout << iter->subString(text, 0) << std::endl;
    }

    return 0;
}
