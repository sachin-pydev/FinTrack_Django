

def sort_records(record_list, sort_by):
    if sort_by == "date":
        record_list = record_list.order_by('-date')
    elif sort_by == "amount":
        record_list = record_list.order_by('-amount')
    return record_list


def filter_records_by_category(record_list, category):
    if category:
        record_list = record_list.filter(category=category)
    return record_list


def filter_transactions_by_type(record_list, type_):
    if type_:
        record_list = record_list.filter(type=type_)
    return record_list