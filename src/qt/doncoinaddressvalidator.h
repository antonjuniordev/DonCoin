// Copyright (c) 2011-2014 The DonCoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef DONCOIN_QT_DONCOINADDRESSVALIDATOR_H
#define DONCOIN_QT_DONCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class DonCoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit DonCoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** DonCoin address widget validator, checks for a valid doncoin address.
 */
class DonCoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit DonCoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // DONCOIN_QT_DONCOINADDRESSVALIDATOR_H
